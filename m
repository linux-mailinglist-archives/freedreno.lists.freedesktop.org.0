Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0046E7D1D
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 16:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F146710E9E1;
	Wed, 19 Apr 2023 14:42:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E7910E133
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso1546700wmb.5
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915320; x=1684507320;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=skGYkFK59/ukAv0WKnmVB0D2Vf4WzLOkmRLP20Jah6Y=;
 b=S/SHCet7T6o1bzniNlVL7gE5UJCdDdK+tx35QCxV16Avx1ks+QhmoPpYR2iSn97x+8
 fLji34fU/fXE0o9jI7a/N8JijPFVvqqy33aYjQH6LNCt+o9Vh5M+YN3Y8fwYvncGyt/k
 CvzAoGf3BF8d8zcZ9hSQalXdd+vEIQdtb5NX4XhU0KoH7+kq4jEmFjjT7DxbQeMPiyoD
 BhdopBmJJVZx9a8sn6P+g4em3ROBjSNsIpQ8MPCDoxkla+SchV8YnH6VR00JiVfzBL0v
 qCnngF6JauL//7bl8cIVDhEeqgtCeG2Sa0DG9focJRhG2jVIUOgYXOWQgCMuaC9lTYf4
 hHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915320; x=1684507320;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skGYkFK59/ukAv0WKnmVB0D2Vf4WzLOkmRLP20Jah6Y=;
 b=VQHaZIRXr7k5CerGh3hH+xuIafsShPiLK0O4vck4aa8+RvFYyJV76L7iJWLVgczXXt
 VUxzfZruBjGj6LDAgN7ex1VbQwPuA2Nh1dg6PKf7OjWeweP9wE0yLv2fRnaIaLK9QIXc
 awEr+adlQiuos9qyc/tg+F9AGn1unDg6WKVk2hY25oFZR4YvDhyyT8ikapMr3FVcyTF/
 7Qfhb9ff8W5UqtznHEdxJwSVIzYkX1B+ummkxalphziJ3WWC5aviyI/DGWpF0UGbcPc+
 IvNwajJTMoVzwjI/vNEesnm7zAUpgt32VyvVV0ShLbOx4N0tlHXq4t7DhPBjOmhD0LlN
 iW+Q==
X-Gm-Message-State: AAQBX9dGghMxurZgQfLogDE7uSG0C8Je/c5OCFyQqzCAIjjhqep5UEa6
 7do67m2hpoD3ZuDhovvTkG+c
X-Google-Smtp-Source: AKy350YmaKK3EqTA0/QScooY92hdt3OuAEvnHBAhCJTAnTZTSLhDQXZTU2KFdA8T7mH+W4Fg2s5lLw==
X-Received: by 2002:a7b:c8cd:0:b0:3f0:3a57:f01e with SMTP id
 f13-20020a7bc8cd000000b003f03a57f01emr16543670wml.4.1681915320333; 
 Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-9-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=U2sKqdlLf08vu1Eh26+MgGM86CFL68O4zQFfb4I2ZHM=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2qdLhQ8jKSue86pVPaOBEUFNXXjoToVNKG6
 6b62FiMnMWJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9qgAKCRBxA//ZuzQ0
 q300EACs6Y5bbGsrBx9QQIpO3qcIvxHHO1/cU4aapUC4FXaAFZVZH1fnBncMrhExDQFjg/pzDEf
 9Kfbd7OJCwa3PRdB37UedeKukA4Vl2Bb3TrTSDrHEwX/OOWvM6ZI55NBCf7mStf2JpJNmbaKZ4b
 wCPtIN449OPMeLeKzEh1idAWQCqb68+irLQAXWku1EHOSOYKr6vRvd30fSKzsRCRW96zeuhz4OR
 YU0KZ7M8h/zHbY33ZfizVVwrM/UtF+akktNYosbuzVCoQyz8Tad8czriIVuZn9OTXojW1gJBRE7
 5EBP6GtskcsCrgjkG92vETqb+RXhrBD76QW40hxCpPi0Y8CDlkf28NG/C3m3Z4dZ1Qfw9o0dCwS
 4DZSkWvrCSgGx1zNxRbYmgfgBadzncfRdqdxSs3sJjdTcpHl1GU66Ukd4i5lY3sBETLCQLCtrEK
 KV4YjGVROZWU/tiTTZ8hsoPTc47Tk6DOVe/RCO5RhxH16g6Fsyxj9yu9L3Df5q1Cluxzrkvy02Y
 Dxmd9IDwtOVqZCR9dTpJMR01jD+Ls42Ql/Jg9DU9Dcilgs9u79tmQOWji5YsuLGKYjpsntX/ZtY
 4YA2J/5XL5LCURB9R/Ys0VjFRcBq33Jhyw0aEoiKmicnqzS9xfhzHQK0L9C8mLwg3KZHMh2ePVk
 XVKyDtMoSZPQ/fg==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
Subject: [Freedreno] [PATCH 09/11] drm/msm/dpu: set max cursor width to
 512x512
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

Override the default max cursor size reported to userspace of 64x64.
MSM8998 hw cursor planes support 512x512 size, and other chips use DMA
SSPPs.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6cce0f6cfcb01..2dd19b7aca0f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1014,6 +1014,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dpu_kms = to_dpu_kms(kms);
 	dev = dpu_kms->dev;
 
+	dev->mode_config.cursor_width = 512;
+	dev->mode_config.cursor_height = 512;
+
 	rc = dpu_kms_global_obj_init(dpu_kms);
 	if (rc)
 		return rc;

-- 
2.40.0

