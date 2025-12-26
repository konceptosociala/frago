import 'package:flutter/material.dart';
import 'package:frago/core/colors.dart';
import 'package:frago/widgets/general/bg_body.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({super.key});
  
  @override
  Widget build(BuildContext context) => BackgroundBody(
    svgPath: 'assets/svg/bg.svg',
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: Text(
            'Repo manipulation',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            )
          )),
          GapV(16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {}, 
                child: Padding(padding: EdgeInsets.all(8), child: Text('Clone')),
              ),
              GapH(8),

              TextButton(
                onPressed: () {}, 
                child: Padding(padding: EdgeInsets.all(8), child: Text('Pull')),
              ),
              GapH(8),

              TextButton(
                onPressed: () {}, 
                child: Padding(padding: EdgeInsets.all(8), child: Text('Remove')),
              ),
            ],
          ),
          GapV(32),

          Center(child: Text(
            'Workspace settings',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            )
          )),
          GapV(16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Posts folder', style: Theme.of(context).textTheme.bodyMedium),
                    GapV(8),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: NothingColors.darkGrey,
                        suffixIcon: Icon(PhosphorIcons.folderOpen()),
                      ),
                      onTap: () {
                        // TODO: Implement folder selection
                      },
                    ),
                  ],
                ),
              ),
              GapH(16),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Images folder', style: Theme.of(context).textTheme.bodyMedium),
                    GapV(8),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: NothingColors.darkGrey,
                        suffixIcon: Icon(PhosphorIcons.folderOpen()),
                      ),
                      onTap: () {
                        // TODO: Implement folder selection
                      },
                    ),
                  ],
                ),
              ),
            ]
          ),
        ]
      )
    )
  );
}