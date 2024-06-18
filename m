Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB590DC23
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 21:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C2910E110;
	Tue, 18 Jun 2024 19:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WeWv7JnN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054EF10E110
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 19:02:33 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so808475e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718737352; x=1719342152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o0nW5Lw5L1U/vXOS5IOb1o4dhA6pmFIZMeuoNJs90Ac=;
 b=WeWv7JnNwX9KNYin7q4cH64oCnYBy+0RKypF+Qr0uN8mY4P0VOg3ZCsGnpmEAPP5gc
 Jkc4fYjhbUkpsHS1dtx5RMi2jBAoeJaWpeT8ceIOLHs1Zs7jnXNZIlaK4gj/jSB4Cu6F
 QjHUyslomF9u8a1NtIbweqvImOgIriycA9VonKh2ldb0z6jm9gv21Q0eewBLsXT7Xiwp
 F/0X8HfZbwiliyJesvPqNb3zdsKZerhKFUBRjDbTE+4pIb3WXpTf7rre+JYhB7f3kbie
 DNmjnBccJnBcD89xp7Hgq2OHoUOnlZx4xytmGnegzXX8wO1YGNQGAHdUu0tNvW6ZF8Mx
 UfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718737352; x=1719342152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0nW5Lw5L1U/vXOS5IOb1o4dhA6pmFIZMeuoNJs90Ac=;
 b=QsM/ZpiwfMzxJIvDKykhgboIewLRdUzGM7lXP7aiK7szOJoLv3DD3Ib1SroyhjuUe2
 VI6L1ymIFOh8tr1aaOkYrdQwen73lobEcHBqaT3/r38rVZQJU9hWh+WPn5ewIPzDBzcl
 dfhXrpQiVyboabV/FB1ZmcrdopiIm9EyN+h+3zBaA2fHMB/QV2PnuJCgC+Pfuf/zvymU
 if2t/Zi5VLKaU0THMjYb0TN1QXwZWCEGUZtf7XqEWJGU7tIjK1eUoSSF4yy1lKPJ3pow
 bhQBLdKr80nRmRJINyHgxyXPmgg+bMZaG66zjgCVWEQ3cw4Y6w7w/nJkC+cOCQ1+b7PD
 BLJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2lCaUL9MWZmYN31GB/WadQwQaXJ9Nn939PIZA7UGX+2zVSdXfp2LIvNE116FQDfwQm1nX/U6WPgGz6O0NefxRQUK4rFmDRjUUQtA/uaM1
X-Gm-Message-State: AOJu0YzTOdMW/kgNgl8blc11KXSMLR4zN1rmkUdSAzfln39TgqinQi4z
 aNRWoBUe+H5W4Aten3Ci5krsLtEMObBMxJaBdPDE7E4SapXX8KlHaZZQKHvY1y4=
X-Google-Smtp-Source: AGHT+IG7lBWAP2S0mJtpOdeqTmDaeSfFJwS3uCXt8D79J41M/fUJYZCYbP8ihtzZVXtw5EnRrS5WtQ==
X-Received: by 2002:a05:600c:787:b0:421:8179:6127 with SMTP id
 5b1f17b1804b1-42474d41065mr6543715e9.20.1718737351821; 
 Tue, 18 Jun 2024 12:02:31 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811?
 ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075093a3fsm15011713f8f.1.2024.06.18.12.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 12:02:31 -0700 (PDT)
Message-ID: <ecadeb37-fd12-4b63-949b-136356a42362@linaro.org>
Date: Tue, 18 Jun 2024 21:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240618164303.66615-1-robdclark@gmail.com>
 <20240618164303.66615-6-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618164303.66615-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/18/24 18:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +static inline void __build_asserts(void)
> +{
> +	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
> +	BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
> +	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
> +	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
> +	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
> +}
> +

patch:394: new blank line at EOF

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
