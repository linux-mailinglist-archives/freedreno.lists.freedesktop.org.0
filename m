Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F385A349
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 13:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0310210E3B3;
	Mon, 19 Feb 2024 12:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JB6R4EJz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014B010E3A1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5112bd13a4fso5678859e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345850; x=1708950650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLdl6L9B9xNN7MHktxsnfp97MoBYqe0FWbydEm457Kk=;
 b=JB6R4EJzwBuo1DtXsaevwGvMBkxQssehpwARUdc83cAB5uWVNR+yECV0Ybr8s9+7Xj
 PVdgs3RsVkn5M9z3RGdfcaX6RmFEJvS15iqi6LdLLpNn1KHFJGdZMZME8d+riyLVDOSf
 oHrqySR8cPlKDZYIFmF/tAx2Ya5JTsWys3/8jIXlj/IBnSiR8MdNYhccckoLHpNqwL5W
 /HuE1zHEABBLXIO4x3Q7iP1W+MKoqhf2SdYRutovGp0kncqP9V5Hnsqkm3TRaO5Ik5OA
 23uKp1YXuJ8o53xLPej3eUAKrYolizZ5v4W3So3Fgyq7Q8NJ0o+B/D19bfpKvBcrr24s
 c4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345850; x=1708950650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLdl6L9B9xNN7MHktxsnfp97MoBYqe0FWbydEm457Kk=;
 b=oT5yEQGzPJM4oNwZuM9m4e9W1dosFbPFGDpMCvlrN1+a0elUTtXPCzwS2snAFiqER8
 FexxH9cP4HtsDCT6bW9LXnleEmVIrG7nISNj45TBiQI5QbQnO7OFcfr8nB8RzkPbAOAv
 zmu2ACzoWBu7GLhtZJ/aq4jLAH7ZdgKVvDbQKZaQgEtRavHHTYvSwz1a0R7z4uct6dy1
 Vc84JbwFPZktymIRfHNVgBBWVXes+0aX44ym0cEj6v0gEbLHhyHNo9FPKV0+0TA+A6+t
 B6LlBrfXoxb86CH27ekXHWhEbnWUs580Yu2Er6pFeeCI4tf3NHeuf0a50AYbILX6tQqD
 S0Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgl4R68KGU21V71SiITmRZqCTmAV5W/IKYeKBcCu9mn5J18Uj/d+NVEZn28tGCsz0JVX3VCKMsG6eS3UF0qXR1FVpizWuyMURdeWmJC0TN
X-Gm-Message-State: AOJu0YzhZdUw2Uo1DjZCoxciNrQPQfv+Vu/95YwHp3X00A678I8BxZk+
 F0c9Z773oC3hQcSCWDNuNB75/m7Fx8U5Qc8e9eg/yzybTAhe/mqVeF0k7kGON2A=
X-Google-Smtp-Source: AGHT+IG4n9z+P4jhtHzfI5X+mxNuENsOtOdDiJUHwHqh4kGT2UQhJzmzdXFxjOh2c+QYHhltd7P3mA==
X-Received: by 2002:a05:6512:ba5:b0:512:9b12:bc47 with SMTP id
 b37-20020a0565120ba500b005129b12bc47mr3143954lfv.10.1708345850152; 
 Mon, 19 Feb 2024 04:30:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Date: Mon, 19 Feb 2024 14:30:37 +0200
Message-Id: <170834569502.2610898.13932222713163869175.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
References: <20240208-fd_document_dsc_pclk_rate-v4-1-56fe59d0a2e0@linaro.org>
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


On Thu, 08 Feb 2024 17:23:08 +0200, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Document DSC related pclk_rate and hdisplay calculations
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b56d27ba157

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
