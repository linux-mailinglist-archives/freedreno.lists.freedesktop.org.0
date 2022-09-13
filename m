Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC45B7C5E
	for <lists+freedreno@lfdr.de>; Tue, 13 Sep 2022 22:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C255610E4E3;
	Tue, 13 Sep 2022 20:55:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com
 [IPv6:2607:f8b0:4864:20::94a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AAA10E4D2
 for <freedreno@lists.freedesktop.org>; Tue, 13 Sep 2022 20:55:55 +0000 (UTC)
Received: by mail-ua1-x94a.google.com with SMTP id
 a8-20020ab04948000000b003b5de1448d2so3899124uad.11
 for <freedreno@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
 b=MPz2hm1dNp3wtK0Q6VOZj4HijDeEPDlqtG4P+GnwI1ScUXpTtAiMFQURP2+l0rCUxA
 qmrDRKPBY9MbWm16lKVZvzyIUdJdDUkzzrXDRzHRTJ6GX/yvA5wXbbFrPXBsVfmK5Eo4
 9ogkCukA16YVJLYlQyC6GDCLXZsEW5Jth3oYNbG/63WjVVZ1gvealfQW8jCDjky728Oe
 PBJlPLftoNRA5YfGbbYdkSf/WXE0SzNerEGMYnvyd8sR0THOr0GsvrAeMrBEU6VKtlok
 /9MFSeRwtKp+B3qVEYRyAMqDCg2EYB4UlKeFmcJPYJLNDLU7NZi7lqkjGWIHLveewJpg
 hb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=u98YH0jx3OdeW4UquaiRdtASz50xZgF9GmW5yVmKS+A=;
 b=UubsEHUJnLijabhdfwYH+b5E0P4LV9AQTSmrGuliZ2SZSnrriZQ50GBD4g3/DKwl3v
 D9k5SV4P5YfqkBMpSpFeje8atJY1bwAHaznH79mpQOS0/D5M0S7qTwHmhdnn2WkVREEx
 Ac3f3R/aUMmf5snXkt8JYyzx0rjOplh6b1ullFjEv3Y0MmKIrjEMgu8yLeOf+/8tUFSC
 dcPGk5BUguJM8Oto4dYI6cJ/CerBpGCfCNT4WbkFuc2HQRFgdLpPv//Z+egL4bZE02zs
 BybvN/NR/MBvFcjZrxCbG7udBDLPzTkv2t90a22hxext9jm+Lz6sVmrxxfwoXxRbdClO
 JhyQ==
X-Gm-Message-State: ACgBeo1lGI538bvevhXU+1wEITk8nYxbFDy/MQoSfwA9Wa7gNjOQJiMS
 Bcoi22jqrxtsYv9AxtJzVP/kLoJ1cQ==
X-Google-Smtp-Source: AA6agR5NeheBAt2f63oLFPCmdLpznilELhZXE8PxzUyHeV2qLgMAkY7E8Tau4uJxbQ4Q64hU2nMVSO1q4Q==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a1f:2548:0:b0:3a2:5fbb:6485 with
 SMTP id
 l69-20020a1f2548000000b003a25fbb6485mr3366058vkl.18.1663102554926; Tue, 13
 Sep 2022 13:55:54 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:55:48 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205551.155128-1-nhuck@google.com>
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [Freedreno] [PATCH] drm/msm: Fix return type of
 mdp4_lvds_connector_mode_valid
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Nathan Huckleberry <nhuck@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The mode_valid field in drm_connector_helper_funcs is expected to be of
type:
enum drm_mode_status (* mode_valid) (struct drm_connector *connector,
                                     struct drm_display_mode *mode);

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mdp4_lvds_connector_mode_valid should be changed from
int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..7444b75c4215 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,8 +56,9 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
+static enum drm_mode_status
+mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
+			       struct drm_display_mode *mode)
 {
 	struct mdp4_lvds_connector *mdp4_lvds_connector =
 			to_mdp4_lvds_connector(connector);
-- 
2.37.2.789.g6183377224-goog

