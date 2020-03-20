Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFF18C72F
	for <lists+freedreno@lfdr.de>; Fri, 20 Mar 2020 06:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB86E119;
	Fri, 20 Mar 2020 05:44:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10AE6E111;
 Fri, 20 Mar 2020 05:44:28 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Mar 2020 11:14:26 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg01-blr.qualcomm.com with ESMTP; 20 Mar 2020 11:14:12 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id B9E492916; Fri, 20 Mar 2020 11:14:11 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Fri, 20 Mar 2020 11:14:07 +0530
Message-Id: <20200320054409.32509-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v8 0/2] Add support for rm69299 Visionox panel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Adding support for visionox rm69299 panel driver and adding bindings for the same panel.

Harigovindan P (2):
  dt-bindings: display: add visionox rm69299 panel variant
  drm/panel: add support for rm69299 visionox panel driver

 .../display/panel/visionox,rm69299.yaml       |  73 +++++
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-rm69299.c    | 295 ++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c

-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
