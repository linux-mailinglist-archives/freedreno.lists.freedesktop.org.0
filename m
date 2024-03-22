Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A9B8874F6
	for <lists+freedreno@lfdr.de>; Fri, 22 Mar 2024 23:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55947112886;
	Fri, 22 Mar 2024 22:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z46yACqO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040C3112888
 for <freedreno@lists.freedesktop.org>; Fri, 22 Mar 2024 22:57:00 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so3598050e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Mar 2024 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711148219; x=1711753019; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=Z46yACqOXwgBsPX4pcQfYQ7kEd7JcfJKy52M8xmK6m5qpiRrhr0jVrBQDtWUVl7OQ/
 6OKzDpCu3GX2Y1ACtMFo6LVeTa9WUjBmvUM31CuA5S/58gHakErKhN0QLWoEZ3UNJU/s
 F2PrXXo8k/n9IOwU8UVFePPGMRyILkKOAo6A7TU0SoS+VxCga1cqxUEMoBzc0md+I5Nf
 ibUNtYOHzwkg4X8GkIRVMJhCRoiUAz+7wnKEVeRGRDCJeoG2pClwuEfWVWkxKWi1ZHJL
 yvw6mKYZzjY9vZTEt/Qa7HavZw24XLT2LE2ogBeF4kOdBZ4EmNViDxeXbKlC6ziEBKG4
 +Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711148219; x=1711753019;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=YR1PCI1eyyA/xsQlpOHy5Spi22/VgL8gxcLwsJMLEFhezkh/OgfOq/cvlZ++NhiCPz
 f28uuSj1iUdroMw6OAsiTBIbrNjGlfDCO4qsI1U8kUEq48K3w3HAovy2tz7RrX3oDe4H
 LeE6GLFxHu9WxDmAO40fruElI8dnqJq6f2o88/hZetNqnzVRzhBGyKLBxPJJdluzoNHy
 Cd39LMrwC9X3VT4BA8iy6EulS4epfyo/wQeFxtXpBHUwx9MJ7DKgNhE5YtJEiUt9BVxd
 iRs/Vn3Hl2ObDrnTHXYMUrbkHEyGoAlA1QY9rQ9JEFVqx0ZRASN53A0hoGinLrroYTR8
 q3mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1xUn3u2vlSs555e6CZqj6xaDViPg2e4RV040xJjv8Vy4cooZW9BlCwHdVudXRZcpdXCcRz8ZLkDUruh6SnK3r2TBC+KofOl/sOMyLwUOs
X-Gm-Message-State: AOJu0YwMTkaJxC61bG20kyGjkq1NAscP/r31zKNlM1MlPaA3F6Lg8Sn8
 9BF460Ga28Cezbwb8X70IzKrP74K6VZPFVRS4/8DMMmFXzH/IlZ6maHr7WsCgv8=
X-Google-Smtp-Source: AGHT+IGdp+o4CDbwmcSah48K76ZnFm8Lpri3RosPHxDjMy+zNnVHyIo5UxLjLdqY6Hh1qIxp+YMhZQ==
X-Received: by 2002:ac2:5611:0:b0:515:852c:c77b with SMTP id
 v17-20020ac25611000000b00515852cc77bmr463629lfd.39.1711148219036; 
 Fri, 22 Mar 2024 15:56:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 15:56:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:56:53 +0200
Subject: [PATCH v4 01/16] drm/msm/mdp5: add writeback block bases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-1-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+o/nm0v9VxfyjaFzlD26OA0ztf8G7XYN2DKnPv8nz8cv
 /6rdFNhJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmMlGWg2GCr5C8843Zf6Lz
 GObIBh5dunfTo+2mXFyH6tyKmz4091r4vOZvONnbekz6mbhQm3ko54up7hYCLzoflwvzBVta1Vt
 tiAxjl9DNTpyT9o+v4qrW1ens25pP2LAeO8aza9l76WjepmdHbjIUVm/8bcWpr9AdLPrw6deVMg
 VHu5fU9UTOq9mz2zprtqUa24d7M7Uup9uVW215s6zTLKkptdfRpTtMdj378fSiFbNW2h1481Tu7
 M+9U5bf8VNQTrU6vpm1mdGkdQrDA9OiwpoDuyJfGkVWHAisbX7wR2ytJlP7+00e9zkMjE+4pkmJ
 Jz4PDPTM/3Fm9sepmud/XJO9+y3g8zV2SVWZaKeOOKW1AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2

