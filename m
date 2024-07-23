Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2491939F97
	for <lists+freedreno@lfdr.de>; Tue, 23 Jul 2024 13:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1C210E051;
	Tue, 23 Jul 2024 11:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VG/gVfRY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A6B10E55C
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jul 2024 11:18:36 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7a47e2179dso85003766b.3
 for <freedreno@lists.freedesktop.org>; Tue, 23 Jul 2024 04:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721733515; x=1722338315; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=K8pz/FAf9Y2J7AWsrfobX5Hrf5irrouEfWs4xbMtYH8=;
 b=VG/gVfRYiaJjngfpEa49rZw074nTVIWl4+oCoRBO3No5Dl4Yzzeyss+jZsdizyQcw+
 rIjIUFu7u9w4uwiv/Jfr4QzjWxtXna28/3/mc7RsIL7IKs6isi+FOv7/KpbrfoVCclN0
 3yTmJhReHbzEyNzNaZXBDHLbgkKfnKBHOwqwMbebvDQ1C8EMQuMQxKtm7ePV1KurFWCZ
 J3GTSz6qWwcKhH62IVu4mZ6OOFGKlwaGy6PHuem2gwNsklmSkDjYC2Y34CIwlG9vqC/l
 zz+aKhdgMMqlTsn2ke2PVdF1REWLqb6Pt7FCoFAq906cphpT8oe84K7Zj6qoo/ud1oqk
 UNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721733515; x=1722338315;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8pz/FAf9Y2J7AWsrfobX5Hrf5irrouEfWs4xbMtYH8=;
 b=Oe5i+uasoc8GrA+6aMhK8v8QQImzK3WECRuZhBFB/7O5Hk6ud4cbrmwDIYsMXth50e
 CN2fP0Qv3rfPV4j0E7Llg/j7GX5R7Eqj7Xj7xtcWexcDhhpvMi1133q0GzqnSVMGpl6G
 PbZ9tsGr000Hkhxo16U841bEmM4/NTRiZxJONyNhmJPsjg0q0yGtXr0VS5MsEVdJUxvM
 Hkrj4lFmLI/x61PsbOhJOUhT43i77vZ/2QhswZSy0K50dEEMER9nRUkLtKwP8O7bs/KU
 2uwzk4DwDnQvFumLVPyyfTretq66Bm9hwxWtJn2E4LJ25appZq/QNZp/XjCqastBonUU
 DryA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoB4c4D7/2p1yZ8l8gbAlwS2Ykqc5BB/G2q825tJL8Y71FCcJKYPhNgc+AQ9paz5M18V3+W7zTxIQ+JHBp9QLa5MkTHQISxD4afGA/xzl1
X-Gm-Message-State: AOJu0YxZ4pYsC/NPibonhXCmqjGuXZ/2sgfRTmNAOoXlGGMkVmepmnIi
 4ajmrKriMcRVfg4gTNAxQBcEzb2vycYW01s/tYi5mMccOEV4e510TtcyzITduNs=
X-Google-Smtp-Source: AGHT+IH+nAkhVaUuFpy0eYD4Hkm0wvZYu/TgIVWiiE/k5Ra+9jejRzLV7ZCLoUoz8xpoEdWHoADa0w==
X-Received: by 2002:a17:907:9714:b0:a77:c26c:a570 with SMTP id
 a640c23a62f3a-a7a87e35d7amr196478266b.36.1721733514925; 
 Tue, 23 Jul 2024 04:18:34 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa450c188sm15632966b.34.2024.07.23.04.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 04:18:34 -0700 (PDT)
Message-ID: <9932bf45-f0e6-49c4-9d46-e55f66fee556@linaro.org>
Date: Tue, 23 Jul 2024 13:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers: drm/msm/a6xx_catalog: Add A642L speedbin
 (0x81)
To: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 airlied@gmail.com, daniel@ffwll.ch, fekz115@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, cros-qcom-dts-watchers@chromium.org
References: <20240722184314.36510-1-danila@jiaxyga.com>
 <20240722184314.36510-2-danila@jiaxyga.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722184314.36510-2-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
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

On 22.07.2024 8:43 PM, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> According to downstream, A642L's speedbin is 129 and uses 4 as index
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
