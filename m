Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2CB9A67CF
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 14:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7221510E4B0;
	Mon, 21 Oct 2024 12:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aN6q36og";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DE010E4AF
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:49 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso64497151fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513067; x=1730117867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/lwrPsOwBrb5oh/mkFzBAjwdyTSBus1TJM49Q2CS5Q=;
 b=aN6q36ogRDcaZZ3WS544kOz2UcJiryK66b72g28urZxc4BBS5k9Lnw7RZ8JgRfW0fY
 lAm5zGDZbPjMJxe3Quwd4zgTF0Nx2n8FyTmEVfPer9EKEat2QJuAXjdDwUwtR4xRJM8e
 I5BFqC21nZU+5MWMNVL9zsCl7LXU06bOxxM9O+iYUhvUq2Ru6HIZOK+7UtH+YZHIFOcV
 foYuHf/SFC3ZE8RMBLsL+tP3ifbmfMItl/RWcWTXAzxp2b9BHiB/YwYNMdQgxsNyYxN7
 DPWxVSOo7S1aH9vo3t93BOTSmeyf/tc5DXoPXRqfkvdKvFQu6z+3nygXzoKtBCCcr8s9
 ZcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513067; x=1730117867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/lwrPsOwBrb5oh/mkFzBAjwdyTSBus1TJM49Q2CS5Q=;
 b=NxyxVdsEFvRFfIFPqFX9P8FFLbK6R408OSK4/uuQD0jEkAAQAfcakstzLDhjux5UEf
 tO21WeUeYTKHgpnG1iK1RgsR2D+Lw0uiRf3LOIeFHonnQcVyvocz1wpIc3tG2pHjKdGL
 TW5z7wSQPQNIDbumioFhgHY6OYkaV4YvUJRfAlL0W0izw/m1D7f8nplCe0uRkh1LG35H
 nmAU6pJO6m0hCYbYE0OYKUJEvRV+L8AWsLsVrCchs7XoaItBAlW7hy3T50rnHY5O87Ro
 1FIKgzrhqRBrt2kRaNeBPisrhxxTQ3cU6XoWnrLa00kZaecj2qicb4ArgRwMchYXLHm6
 tiHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFHnoJyuxNCCxLMbAtmuC6Wx0xu72ZsOADJjc12m1Wu2QNTPYXDcZGeY0O4Ox5aK2ShvgzbsQSghU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6vRTdCLPcF/NFW9nhcVBN40wk7SB/jEAh1+W2l5cEev4Iqitk
 NAgnxZZtveEPtVRzZBRGLfhMp1YR4l0gu3LsI27KaIHq3afdMcEYgFVMMoV8tm8=
X-Google-Smtp-Source: AGHT+IEP6mcffhGZSX7EvL34NQS3DEgeiHeuK3RZgNWRLKAjBPSyrv8ab7zBjb68JmV7/I2QOU28cg==
X-Received: by 2002:a05:6512:b11:b0:539:8a50:6ee8 with SMTP id
 2adb3069b0e04-53a154da8c4mr8581550e87.57.1729513067076; 
 Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm8998: make const arrays ratio_list and
 band_list static
Date: Mon, 21 Oct 2024 15:17:37 +0300
Message-Id: <172950935861.2053501.4420742606956398087.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240912151037.592477-1-colin.i.king@gmail.com>
References: <20240912151037.592477-1-colin.i.king@gmail.com>
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


On Thu, 12 Sep 2024 16:10:37 +0100, Colin Ian King wrote:
> Don't populate the const read-only arrays ratio_list and band_list on the
> stack at run time, instead make them static.
> 
> 

Applied, thanks!

[1/1] drm/msm8998: make const arrays ratio_list and band_list static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71f40d32fa4b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
