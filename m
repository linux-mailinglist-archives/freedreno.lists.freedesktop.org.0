Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334356E7D16
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 16:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB38610E133;
	Wed, 19 Apr 2023 14:42:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1933710E133
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 14:41:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o29-20020a05600c511d00b003f1739de43cso1548609wms.4
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915316; x=1684507316;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bbQkv8jwrzDkswGUNpm+pnkw/ViVbiTH2eyiHhJb3M4=;
 b=xpqwOKviV3x6su4F66G0lA+GLbxZZnI5CB6LrMkiVKlNfY184LccJ0g/wVEqGcKIsx
 RGVql6UqqH8puGBagZvlGoVC0DD1VpP35GIbxxfraL8jGnb0qHtaBSk7K93EpB4+PCtv
 nMoG71hok4guw52ZAJReJ4xRGrXk2mCRc904XOLgw63OUNHFide9KukVfKkngesDhGwb
 uXTSnIn1HfFEWPLCGxia1zJr+Crn9oewGMzuzbGIRM55foxtX/A7zXve63LtGtmmCGGh
 aoLEfRBTqy46CdBc57ZGzBXagrMFsIWzyX+2FHVWzsr47erJlsI9mR5R7gOKDnqFd4BE
 ITfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915316; x=1684507316;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbQkv8jwrzDkswGUNpm+pnkw/ViVbiTH2eyiHhJb3M4=;
 b=UBMHbWFfTJUkg+OKpM1AAqyL/DFK8db2SIAPdupTi0/oU38GvGeXgs3BQxdMDQImif
 J41UAY9MlHMYgcGXibQqGo5Zm2ki/ezeheW7b5/c1b/dYkXjUF3KOG/bQ5XWUlNHqfnT
 4I4WtQA/HQOo+jcy3iphSMpgsSa03RHu9iWEPu4dVtkMJWudSEn5WuPw8sWe5HAp8VR3
 Dg86bRi5HOZEFYv9aIaZZYWwAYAb8ak1dm2jIMVBqbhsMbJlcd/H8DysbY8v9+/LiOCG
 tUvVbtnFKAHRp8zewxQGAsO6ptzp0Er1kQIi+a96QFuwTck9evdLVWTve5CATaLGtN6Y
 FfmA==
X-Gm-Message-State: AAQBX9fBbbq6p6dLxd0qlRB8rZ8t823bd4+sLI0eM/c7OdZ2RhIAqCJO
 hVN7HFoJfJJqEY98fMNG8E2t
X-Google-Smtp-Source: AKy350b2tHD6YYOyF6EJNHwhdDG0rJNjjB5sIpYsfjHVll/9aH5noTb+iMAlmgjsu/owIXVuGlVOuA==
X-Received: by 2002:a1c:740b:0:b0:3ed:276d:81a4 with SMTP id
 p11-20020a1c740b000000b003ed276d81a4mr17303138wmc.32.1681915316615; 
 Wed, 19 Apr 2023 07:41:56 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:41:56 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:07 +0200
Message-Id: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT9P2QC/y3Nyw6CMBCF4Vchs3aSXqhSX8W4KHSUiaGSDgoJ4
 d0pxuWfnC9nBaHMJHCtVsj0ZeF3KqFPFXR9SE9CjqXBKGNVrT3G8YPTTOEl6OqLs8qdjY4eCmi
 DELY5pK4/SKJlwr+zOMjQeN8cuzHTg5ff6e2+bTtH7Jp4hAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=NLA8aCokPucqX6VgfqosaRbjjOEPuDhGV/zebS121ow=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2Sx+NGYnUY5kQUzXMuJpNkUO1J4MQIjtMlw
 LyJMlg0K7mJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9kgAKCRBxA//ZuzQ0
 q5HoD/9i3Ejx1LlCyQTcY4w5DlwreWOk6HnY4l/N3UMPC0w7x+mPamsZ/cVo9/uUtTy0c0GonyD
 j3iDZj6dvoTbozDGIZlfflLEORYJ7U7Rl8p7ILtlby7FDUc/tOzPTNj+umHN07JxMOvqtjpqSOE
 Eq1tdJ3x1pmrtE+PZhkNRZ3hA0RxDQIuya67zwFuo6ufl9cyB6S1rGKXbcIPuXpBAL62OkI0naF
 6+tHvguoYSez/ttIBx+nUtvQ0Lc0MxoPrAN7V4jLUmCtuX9OpkenNjGyzHt21PcE4zS8MUr0wdR
 C7Cq46GHDJ55bRgmeHCYAPCmZpoq+8AQjtHF7M+jbaipQCOfFihatTvjNmpb72FZ0Av2/WWrIUV
 vdSQsQXvjDyZm4rVjZ8HTOSHpRM7VV/54RrHvRHQ8LeIgZCpJ2Um2iWgR3Gt3prM95TE81NMbgS
 Eg2TeA6FJbL/qRnOxub6KXJt2TwsGel6hWTQibC1TTFx9ca36nhkRerIoDbUJ+n0giEcO/+wwN5
 HhT4nusm77Hz5vjB88rtS2ujUrqgBJjDQpy5Z2PZZ6wrvK3OvXxqB9liCswFiJxKt4RjcgV6ZEf
 XNMKq1uNSs3sMOo9S/1rKKD4rzvg1r0d0iASkk96naqx/FDa1htSCytlYpjaMmRH6YDQpFZ+jmV
 iMAK+6b2HNR3l5w==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
Subject: [Freedreno] [PATCH 00/11] drm/msm/dpu: tweaks for better hardware
 resources allocation
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series include misc fixes related to hardware resource allocations
in the msm dpu driver, some specifically for msm8998 (including hw
catalog fixes and cursor sspp support for cursor planes, instead of
using Smart DMA pipes).

This series has been tested on msm8998 with additional patches to enable
hdmi support.

The following modetest example command works now; 8 planes can be
displayed simultaneously on msm8998 in 1080p, including a cursor plane,
using a single LM:

modetest -Mmsm -a \
    -s 32:1920x1080-60 \
    -P 33@87:1920x1080+0+0@XR24 \
    -P 39@87:200x200+100+600@AR24 \
    -P 45@87:200x200+200+500@AR24 \
    -P 51@87:200x200+300+400@AR24 \
    -P 57@87:200x200+400+300@AR24 \
    -P 63@87:200x200+500+200@AR24 \
    -P 69@87:200x200+600+100@AR24 \
    -P 81@87:200x200+700+000@AR24

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
Arnaud Vrac (11):
      drm/msm/dpu: tweak msm8998 hw catalog values
      drm/msm/dpu: use the actual lm maximum width instead of a hardcoded value
      drm/msm/dpu: use hsync/vsync polarity set by the encoder
      drm/msm/dpu: allow using lm mixer base stage
      drm/msm/dpu: allow using all lm mixer stages
      drm/msm/dpu: support cursor sspp hw blocks
      drm/msm/dpu: add sspp cursor blocks to msm8998 hw catalog
      drm/msm/dpu: fix cursor block register bit offset in msm8998 hw catalog
      drm/msm/dpu: set max cursor width to 512x512
      drm/msm/dpu: tweak lm pairings in msm8998 hw catalog
      drm/msm/dpu: do not use mixer that supports dspp when not required

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    | 28 +++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 49 +++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 16 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 22 +++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 32 +++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  2 +-
 7 files changed, 107 insertions(+), 52 deletions(-)
---
base-commit: e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
change-id: 20230419-dpu-tweaks-5475305621d9

Best regards,
-- 
Arnaud Vrac <avrac@freebox.fr>

