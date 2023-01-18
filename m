Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7754671097
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D7F10E632;
	Wed, 18 Jan 2023 02:06:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5206510E62F
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ss4so72541943ejb.11
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLOiM6AzwpgYa1Gps0o2b4LGU2cihDfkk8wIckZ2dtw=;
 b=KADHcLXS1rTHYf1hPvKS/I4cvnDIE//3GCae//1L3Dv1aAKc92WBlmE65fxo3qf/R3
 suvOD9B39tKF3oi9kp1MzbnEbXupp/m7Rn0Q5GVg5SRpV07HA9tYECpwLDPoSsc9zfUb
 DAdYFlO+HWNeFtbpb+8YT3geFRg5CQyGip9uXiQWblDm8GK3wJHYnKvqffHWwxRb9lxE
 oCE17UFBF6aEkxfK74c+D6IyXOi65a2oNhTdyB6G0lPrBHhRYbdut1m0g/5OmxkCoizW
 qQbga8MaiaBKEFlG/7MMKC0OsNErEtAnN9lkIJahY4qOuhelDXYJYrOdW7pmc9w/SyKd
 PNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLOiM6AzwpgYa1Gps0o2b4LGU2cihDfkk8wIckZ2dtw=;
 b=YKDh7WsqTXH42j4HJKf5fdJb376eFZCH2Odnl2X/baExpqIjQq7IPpZPoDukSfseYg
 jr59GhCCOMG44utxFQIbONVjpL+uT2iScYIs7Z6+ZEl34GoFyTg7RJK1cvNj9g3otlhy
 Ny4/Oj7RouUz+NBa++oAA+K5B0fmN1VmfR1RHIYOQI+xUrR4uGnrftflj+PFD32ZZgoe
 n81zg8ci3Oyz8nwUp86LFDUftEAh87CZ0LWE0JGEmfE4BwgwasbwTzFvi0hMBjD3ZLoH
 4fTxdPHNWIQFEwGZV2owZMGI5ZZSimtz+3l+xI9QvXADocGifmHnYx6i8W1kJTaHbFx8
 pt9w==
X-Gm-Message-State: AFqh2kpRWlEBCcflUZR+OpmiKir/75dng3dExn/B20Ms9h+pMx1g6HNS
 bJ3TizaO5amgyXkvjVyVt0a0iQ==
X-Google-Smtp-Source: AMrXdXsB+KcYxTvDBzvXoXaGBtw21/snKAs7oxT55WhZm+hCVlsUhTl0IsRn3cg06+yrXXbXrBXjEw==
X-Received: by 2002:a17:906:1c81:b0:86f:d1c4:ed08 with SMTP id
 g1-20020a1709061c8100b0086fd1c4ed08mr5038984ejh.69.1674007586915; 
 Tue, 17 Jan 2023 18:06:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Jan 2023 04:06:09 +0200
Message-Id: <167400670535.1683873.1092572126944377205.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
References: <20230116034435.569512-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: enable sourcesplit for
 sc7180/sc7280
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 05:44:35 +0200, Dmitry Baryshkov wrote:
> According to the vendor dts files, both sc7180 and sc7280 support the
> source split mode (using two LMs for a single output). Change these two
> platforms to use MIXER_SDM845_MASK, which includes
> DPU_MIXER_SOURCESPLIT. Rename MIXER_SC7180_MASK to MIXER_QCM2290_MASK,
> since this platform doesn't seem to support source split mode.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: enable sourcesplit for sc7180/sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/00feff8f1274

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
