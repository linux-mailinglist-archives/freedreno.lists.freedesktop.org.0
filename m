Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA510A474A7
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3571510EA3F;
	Thu, 27 Feb 2025 04:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H073G/s0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7E910EA29
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:01 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5461f2ca386so416197e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631080; x=1741235880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HzmKzyqYbo3hawEWPEGsqia1eprcAJ4Ylg+Lj6WDtUQ=;
 b=H073G/s0ifQy7tsXgJ208ZELkUlMkxukeETEAp7XP9t77hBCHTLsGcRBviaiuTFtqq
 EVnfcGMrVNCTA8nio+dWONCA4jOpg84oIbQXUTcSNi3juPBIG0km9YzOwIAke1QyKttg
 9jKTbUH5sArQvgqLLgOfFLgk57XEWhVQGC+rGLqoaEWAq43XUkpr0ezkWD80fWOCVTdz
 uNLBUh/TpTC69ejkW+4qEl5IefNgq9EAvmNai4wsBQcnx2A8K2BLhN2sNqJnzaSH5PSQ
 V9wPBb+XgbCQ1Li3m+dQxkJW8lgIzKSEJean5/VntyJ5nZWvJmnPNyTX2nLNCi78fP4u
 rlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631080; x=1741235880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HzmKzyqYbo3hawEWPEGsqia1eprcAJ4Ylg+Lj6WDtUQ=;
 b=LpoHltiYOEyhTZjYDbrfrk7+wiovn/izT8ed/UOzLw/R0+e4BxiPAwUW16NsS0M45H
 y4CzrLgIlAcWSiS+6GZnezMiqt1++fAa2lPce8b3tpyO6qNhj1mNEzQRBy/HNb12mKbr
 c3hsUbJten7pz0ZTrArXep76HXm/nsJ2J6G4ZKHbcDgZma4Yu/R9dEaLK4290qOCe/u4
 /vArIxWXhuCgYZR2cED0hKu7V7Kdw2r90bv/lMDhIrFLX5q1HrCg7XZyzWWhFhtQrR/P
 csxuqZanZonvEprh1e6AkyVNw6J4rD3nZgb7AWfx2+uJ92Pki2ZStEBQOlgn4L3ppLve
 4koA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKu9wz/quNkAPRovoMtSvViru1ZtsXGS4DCd+Rn4ke26312hJ4vjSzViIBWlU4NNxhpVgTYxb2FHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlgbjfOskEdrgsZZnhb0IL52cd/QsNBhDu1QjIbyxIkkge8Jsl
 zYkAjzFyyum7DAKHhHd1qzJJCz9o0/4wfy4lYUgiuh2P1q5KEjMq1ObV3Qr3W8M=
X-Gm-Gg: ASbGncsXsMV27JiB2sov/Bc+1VJC4YW+jBNOm2MWYqdukA8hfFavgs4ka5ebD1l92F9
 xdWo3vm2BZNEp4KP/02rmpX4yhdYxRLCuUBz9kDKlLcqYYW04mxw20Mncf8hBnKnf06phUvFr8k
 JWVfSEFtod9Qaaf4CoGGuDcBp6o3XQsLfLXJfrRLFSvJiHHHDM2E1tLXmlaX6eV/yq+4ywQjSsQ
 S2A5l3vSeKjxjsn1GEpvSzYetxFzYWtr86enqWk853NZeCVsiR8ulqnIGNGL+3htQn5nh6jGXvm
 2F36/qimNvvS+EdIUU8J3YZLfuR90pX7b7iTBt1D1w==
X-Google-Smtp-Source: AGHT+IGJyfv5tGen846vyQRMebF2qwsXcYi2q7UIL/kDESpfQBWqyP/hiC9cUT0/ZbRg3Tu8CrhGDg==
X-Received: by 2002:a05:6512:10c4:b0:545:93b:30bf with SMTP id
 2adb3069b0e04-54839259932mr11279171e87.41.1740631080047; 
 Wed, 26 Feb 2025 20:38:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1)
 on small SoCs
Date: Thu, 27 Feb 2025 06:37:31 +0200
Message-Id: <174063096235.3733075.3774428548713459070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
References: <20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 22 Jan 2025 17:23:44 +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the Fairphone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the Fairphone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Fall back to a single DSC encoder (1:1:1) on small SoCs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b6090ffb30f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
