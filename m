Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381D6CCD84
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD4810EA20;
	Tue, 28 Mar 2023 22:38:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72F210E9EB
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:08 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s20so14187268ljp.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMXvr4ldGaoMLKgFxzEbhC70jQdRYOcwL2NKARdSztE=;
 b=g8ub7rc/NhXIdRwBUNFa4fvKhu783P1B5PPeqC1IOjSGreMB6OVd7vpmQP9jdEQxt6
 AvIxTKC01UyG0syJ0pIB4ZBUj5oLfgFPgWagPim7k6SJIZgbr07ERJweZG7cV8eunpsa
 bVMAei36lU/+kK2TbKn1SpMBDwZZj9LGiV90QrCt27tOlxrUTJs/K8HsDTfej4o4exUC
 8uHrAzjX6eU0dDHCD1TaQkfw3u/Ny61BHN6yQ+Ro7XlFiRWQkYj3rMXRKlVs991Hs6IQ
 6bk3vV/f1p4ZB/FmMydBqT06XxH7iM964QOvVYjtiNO69azZ3RijWnvaTNxy7Xu5pmlw
 S2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMXvr4ldGaoMLKgFxzEbhC70jQdRYOcwL2NKARdSztE=;
 b=i/7sHD/+9aNzEuHe8UfTROTsEjNx1rcreVeRugkgc/VyMKeoGPE0uh0yQey+/hXIS1
 lJqE4JXN1Oav2hQYmVXgDwxSiE7aez6fJBip4f8ka5MLEtTfZBRCqq4gc0VdxDjB9nu5
 Ulhd/iYfGCR3IY+arKA/WxZMA0btdubhx+b8rU4dhN5xFmDbeh3q+gC68nppVle5pqwz
 P7ZQEXw0Hjn2RN+8ouVxPlaEQCRklpUYQy58augfcH3+UCq8z4XUHEtMNo4jdo3ZIdvm
 hYufDyG3xpBSMLGxzoxMlnD2u5IdTv27eQJ+i3UiKvyfI+evjaNaXnCHLH6aUQIW58za
 2+Wg==
X-Gm-Message-State: AAQBX9foMZqdHW8eofapmXqPm18dSBDJdvOpcgAoLeuPJRi8mxL4+sX0
 +CjjrVM7iExd1ThuDpwQEIa+pg==
X-Google-Smtp-Source: AKy350aqAslp9vV/FU12wZVxKnQvOaZvbsXVVP/2yQtjnLA/einkNp1Ej7QLuVAWmYih7iXDNAV7NQ==
X-Received: by 2002:a2e:87ca:0:b0:29a:8580:8140 with SMTP id
 v10-20020a2e87ca000000b0029a85808140mr5299195ljj.3.1680043086953; 
 Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Date: Wed, 29 Mar 2023 01:37:51 +0300
Message-Id: <168004255464.1060915.1769530231444438622.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306100722.28485-1-johan+linaro@kernel.org>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 00/10] drm/msm: fix bind error handling
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 06 Mar 2023 11:07:12 +0100, Johan Hovold wrote:
> I had reasons to look closer at the MSM DRM driver error handling and
> realised that it had suffered from a fair amount of bit rot over the
> years.
> 
> Unfortunately, I started fixing this in my 6.2 branch and failed to
> notice two partial and, as it turned out, broken attempts to address
> this that are now in 6.3-rc1.
> 
> [...]

Applied, thanks!

[01/10] Revert "drm/msm: Add missing check and destroy for alloc_ordered_workqueue"
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ebf761d6a02f
[02/10] Revert "drm/msm: Fix failure paths in msm_drm_init()"
        https://gitlab.freedesktop.org/lumag/msm/-/commit/35a08e19a1c6
[03/10] drm/msm: fix NULL-deref on snapshot tear down
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3234fe12b3b
[04/10] drm/msm: fix NULL-deref on irq uninstall
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0b5ffe5be6fd
[05/10] drm/msm: fix drm device leak on bind errors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6a44f0dbd141
[06/10] drm/msm: fix vram leak on bind errors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e6091a855649
[07/10] drm/msm: fix missing wq allocation error handling
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9c6027d5a3f4
[08/10] drm/msm: fix workqueue leak on bind errors
        https://gitlab.freedesktop.org/lumag/msm/-/commit/023691129696
[10/10] drm/msm: move include directive
        https://gitlab.freedesktop.org/lumag/msm/-/commit/110fd0d5b032

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
