Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B61324CF
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2020 12:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57E16E038;
	Tue,  7 Jan 2020 11:28:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACD46E02F;
 Tue,  7 Jan 2020 11:27:59 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Jan 2020 16:57:56 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 07 Jan 2020 16:57:38 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 90D402574; Tue,  7 Jan 2020 16:57:37 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Tue,  7 Jan 2020 16:57:27 +0530
Message-Id: <1578396449-17062-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2 0/2] Add support for rm69299 Visionox panel
 driver and add devicetree bindings for visionox panel
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: sean@poorly.run, robdclark@gmail.com, seanpaul@chromium.org,
 Harigovindan P <harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Current patchset adds support for rm69299 visionox panel driver used 
in MSM reference platforms. The visionox panel driver supports a 
resolution of 1080x2248 with 4 lanes and supports only single DSI mode.

Current patchset is tested on actual panel.

Changes in v1:
	-add devicetree bindings for visionox panel.
	-Split out panel driver patch from dsi config changes(Rob Clark).
        -Remove unrelated code(Stephen Boyd).
        -Remove static arrays to make regulator setup
         open coded in probe(Stephen Boyd).
        -Remove pre-assigning variables(Stephen Boyd).
        -Inline panel_add function into probe(Stephen Boyd).
        -Use mipi_dsi_dcs_write directly(Rob Clark).
	-Remove qcom_rm69299_1080p_panel_magic_cmds array(Rob Clark).
Changes in v2:
	-Removed unwanted properties from description.
	-Creating source files without execute permissions(Rob Herring).
	-Dropping redundant space in Kconfig(Sam Ravnborg).
	-Changing structure for include files(Sam Ravnborg).
	-Removing backlight related code and functions(Sam Ravnborg).
	-Removing repeated printing of error message(Sam Ravnborg).
	-Adding drm_connector as an argument for get_modes function.

Harigovindan P (2):
  dt-bindings: display: add sc7180 panel variant
  drm/panel: add support for rm69299 visionox panel driver

 .../bindings/display/visionox,rm69299.txt          |  48 +++
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 370 +++
 4 files changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
