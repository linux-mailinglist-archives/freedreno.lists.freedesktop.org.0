Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3647C67D4E1
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176B10E987;
	Thu, 26 Jan 2023 19:01:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C016110E97F
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:19 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k4so2203839eje.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTeKhYCgAYLn9b2pOWJlFiilL2KqGbxWtCO1YZ9/UkM=;
 b=Zq2IUYVCIk2ZkmKL8yTQ9rD/RcF7gQkTdEVyT/G8FqICTK1KKopxh3D9QABs16DCb/
 nnJEx7GPNlXadntyWwRU3iU7tGl4GKtw+JiS3zk4w5HI89y/f0oZEw6PNbJFEKuZISbn
 zT/m7gWdk3qZScZl88I9FMrgp1U8MqLgL+mfZjYjHDOOQf+IPVynotCJzf+6QlMdxp4K
 53odFHDtAn4mrs6R2dRyBsEQPlY0PTrn/6ws/vrXuvumBXXHW6dH2nd/1dXBDAM4lOAQ
 t1Qg83AcSL0v08OfFO+rcilwdDuCa6gqFpPC8LmX5Yl1XKk3ihClp4EcOMrWAfC4Pe7K
 0Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTeKhYCgAYLn9b2pOWJlFiilL2KqGbxWtCO1YZ9/UkM=;
 b=tVmF7UeXp9MRb5RWnI1JzMFLHElozlG+uqWHUSCeXgkaWdzcvTCx3GBVGAlF05ZuqU
 yO+8lO9nI/V6OlPGtUtYufntxv875VlNbfxWdIMej0vYy+HKPcp4UHprYGELDTMDGdG8
 kDzD7ylhqIVwTBPEnUgCZu2AqJlhNtsyNfuKZllvRpHQWTH3ea227ut6+mEedkTBHXCp
 6avwSPx5mTkzvOn7px5IATb2qrUjocQ8nLcVSz2HPIq/zQrNtSpS84BNctGsV8uIGSCp
 aGlxZ57paOGK/BaRYzzBw8mQ3Th/XBux0lgx6+33/KayinPT5z2PTipIEbLSYJIdf2A7
 4Jkw==
X-Gm-Message-State: AFqh2koI7gm78HBJx9Egx+3Ub/FYz+mxAETq3jkTEBjjlyLH2A4LrODj
 bBL7W18XRrd6Qx6H5EPex5WO1d4WReMYcVCJ
X-Google-Smtp-Source: AMrXdXu/ugKU0aSJjN4CCNX12KjO9+Qm06X/CVkhbq7Os4veQCxLQBwbP5hQm2BV5NQe5Nn4RpOaIg==
X-Received: by 2002:a17:907:8d18:b0:7c0:d6b6:1ee9 with SMTP id
 tc24-20020a1709078d1800b007c0d6b61ee9mr43109147ejc.11.1674759679427; 
 Thu, 26 Jan 2023 11:01:19 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Date: Thu, 26 Jan 2023 21:01:02 +0200
Message-Id: <167475959090.3954305.6194600813887477862.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
References: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add check for cstate
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 06 Dec 2022 16:05:17 +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check cstate
> in order to avoid the NULL pointer dereference
> in __drm_atomic_helper_crtc_reset.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add check for cstate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c96988b7d993

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
