Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC886CCD52
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7213710E9DF;
	Tue, 28 Mar 2023 22:38:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E37510E496
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:05 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a21so6997125ljq.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+xu6yRIN/bJys1fehbCkZUGMmMxxtuBrshP7xCnxko=;
 b=Al5TIrR6q1JFc/h2LqAur7BsT/df2/oRMpHQNhGfUfvJhr/iaz9FKUsFhPkWaT3hOt
 yVpY84Q7BPB60YlgRDkwLpmt2C3Le2UnwOYOgfVR5ssUJBz9F3bsjXsm5DgdaoBXZ+B/
 xMJgOtXE7ibCa6/xgLZBYf9AQII0Dn4ai/pYB1zcS7SyWW7yTrFw74GX0r84tHZYt4RQ
 zCFRo2RgvbiSzMPd2L3NsY+PWsBVI34IbOBv8trP1AyN+mH/GXOcX4F7Pp9ssRJPG+tj
 meIfT1pFYHHPbH24cjii+Pqkb04i5IYJwa+Aht37Nkxie43zOQdzp14VRJwJozETYAKb
 vLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+xu6yRIN/bJys1fehbCkZUGMmMxxtuBrshP7xCnxko=;
 b=rqBB3QAez3j6oN0VTL4NZcHAzanaB255Z/w1j96MmjUKOElklpL3QHmeZw6NBaI1ds
 n/JgKlh0Jhw3mEnAH/YeNii5eQtXbd95mhxG2vYPtu9nXudS2ubn7Z1GmmTxpkxgwI62
 t6i6O8TtG2rU4I/QtTO8kL0bMl7pQzmm6Id0gLP5EsIRmecGYZIOI8q8D4uecHhProyx
 LNxgsxbBxXt7C12CjCEc7QEyIISZlG2lOEN7oGekI6hM8lVSX5d1nYsQZQbN1JBGEppe
 LTbMOrBcZQdq4l9NjhCo9UE2CisCiRnDJhk6+1U1js8fYspgQ284fmtTESdkfJyUtM6M
 zmFA==
X-Gm-Message-State: AAQBX9cAAQYufCbBzL1a7wW11/MwFtYbXNjwls+X0NJnKl3/407kf3CG
 IYUoKYQ8qkVHUhCr2zCEAThCvA==
X-Google-Smtp-Source: AKy350bgyH8LOJ1ATAPftjuIwEIjk5RupKEXKKKMV/7TLrATqUiGPabaR9kv1V0d2QYXK9XVLWYPbg==
X-Received: by 2002:a05:651c:22e:b0:2a1:2cb4:5f81 with SMTP id
 z14-20020a05651c022e00b002a12cb45f81mr5018981ljn.36.1680043083113; 
 Tue, 28 Mar 2023 15:38:03 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Colin Ian King <colin.i.king@gmail.com>
Date: Wed, 29 Mar 2023 01:37:46 +0300
Message-Id: <168004255462.1060915.681238407755431464.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314082050.26331-1-colin.i.king@gmail.com>
References: <20230314082050.26331-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH][next] drm/msm/dp: Fix spelling mistake
 "Capabiity" -> "Capability"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 14 Mar 2023 08:20:50 +0000, Colin Ian King wrote:
> There is a spelling mistake in a drm_dbg_dp message. Fix it.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: Fix spelling mistake "Capabiity" -> "Capability"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6ee9666a4f4c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
