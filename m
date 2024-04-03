Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075F896A1D
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 11:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11AD112910;
	Wed,  3 Apr 2024 09:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oHls4PxR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABAB112912
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 09:11:43 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1e296c7aa7cso2307435ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712135503; x=1712740303; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NOuu3sNA+84lczt5jxnbeGrnj9MwNeOoooH77NlU9Y0=;
 b=oHls4PxRIBNbiqLMVJmbZysN4OcXJRfXtw0KZJn5S0qfAmPtuebNLTd/Vd7HY7ULr+
 4D969SjRG+DlC78sgpahpxNa1/9krqjybVxcnqzeUhgV0UQj7Jfm/eRTkjj3A+gzrbH7
 ojDbjUj2q+v0ASARsV3bD3FTaaJf39aLr70zo8fi9JIMSd50DGquW0+x5cNW7o5rYG8P
 mpFFWQ7xikevLzpGiUmVml7BECk+C+jMQVYLUvJJy7+IBAmR01qfczyJZSzHJoJGBFbl
 qtg//ktrPPLa+3QH8b3J9NOqMT6UkUA4U2eygufwvT7PpF7Qdf31gKj3yK7gOKBIUeTQ
 kq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712135503; x=1712740303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOuu3sNA+84lczt5jxnbeGrnj9MwNeOoooH77NlU9Y0=;
 b=F2ym6Q7ZFpnVuteO+65N618lxtWLF+0Elc0sZGKzHpVKDPMPJoOTBnuL0MIqJ/9eJX
 K2uKj8vvreIWx7NjmPadhPMKaYLx6cqdgyLcXBaMZoqi5EdV6HBpKVeenj/NTtB9StwH
 iVa+F8rC8IUT36xYR8NASBf81E6dxg4RR9JqocmfplNUsrOOrhJwnbQyMEp9YX27mOc8
 p7KQ2SfBgK4A3tuj0nMHLuVe7L/JxpcxZOAraEDM1OYEkAvcQgfPqWDSHfRsuWMnqXFp
 mVHxK11bt5sN47Qm99QY0kja2WQh/iJ7TN+NaU8emR2cDE/NBi2xTdCJoqLVbAv7U2tP
 YLOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV56AcP8yui0l01ur7VPWJPULPNI76E3ybPCfy3bGhJRm9omhVFeL8URrSaQQEXmHN0O1s4DbytbQrt36FecbX+UNT3x5OHc1VXxKN09Jh3
X-Gm-Message-State: AOJu0YyQf8o1gfN9cfBBgDh2IJVsZukqfuw/RsqDDDBf0IKGpxclPGx0
 nSbxfCyy43S9qUqldGWIm0rpnpau2nURkgH59QuqX9jVQzpGF7XFqqltzBdptyc=
X-Google-Smtp-Source: AGHT+IGE6QcA79jB0k2Li5lWPr2yvCO9+FLkeHddHmJdCmFiKZKqU+kbSjtNfgztpVuY/0gLGWy1dw==
X-Received: by 2002:a17:902:c94f:b0:1e0:a784:f965 with SMTP id
 i15-20020a170902c94f00b001e0a784f965mr18198301pla.65.1712135502878; 
 Wed, 03 Apr 2024 02:11:42 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.66]) by smtp.gmail.com with ESMTPSA id
 lo14-20020a170903434e00b001e0aded0ca7sm12688087plb.239.2024.04.03.02.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:11:42 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 03 Apr 2024 17:11:01 +0800
Subject: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712135460; l=867;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=MU4Swq5XDKyEWa3JYSzWqbeemF0ZbJTcthPE2KJsZos=;
 b=hpx8rqn0NW6jrZNlHbx/VHfFHcMfnFnfZNwaA4Q9oljlHNkFfqChP0YhKK5MS9joROjHj9ZCY
 Ys/IqPqN+8uDp67ZK5JQqci2IhuEveJuFZTRbjjhY/AmRAejQSlMBMT
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add variable for slice number of a DSC compression bit stream packet.
Its value shall be specified in panel driver, or default value can be set
in display controller driver if panel driver does not set it.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/drm/display/drm_dsc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
index bc90273d06a6..4fac0a2746ae 100644
--- a/include/drm/display/drm_dsc.h
+++ b/include/drm/display/drm_dsc.h
@@ -82,6 +82,10 @@ struct drm_dsc_config {
 	 * @bits_per_component: Bits per component to code (8/10/12)
 	 */
 	u8 bits_per_component;
+	/**
+	 * @slice_per_pkt: slice number per DSC bit stream packet
+	 */
+	u8 slice_per_pkt;
 	/**
 	 * @convert_rgb:
 	 * Flag to indicate if RGB - YCoCg conversion is needed

-- 
2.34.1

