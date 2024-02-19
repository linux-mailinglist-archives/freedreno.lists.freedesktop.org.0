Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327BF85A34B
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 13:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1985B10E3B6;
	Mon, 19 Feb 2024 12:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wSnggt/F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9F10E3A7
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:55 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5112bd13a4fso5678938e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345854; x=1708950654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVcz4T5lUX/p2dpLrBnJfdqrXGy/EYfTfCTW6sdiHL0=;
 b=wSnggt/F10UyNdOxKgWZ83VBghfjJ33OkqPq7qW7J2CK6XcyIa2UTzu9iX6CydQhWO
 aqa+8W7/sbeImRYAF4znhwXHU//gJQ1yHQL7KTVaSaPUxmvS6JZUHFY2W+syL2gK3nbR
 uZhZkQ1UW41go8+YUYqNMHX5QJfhUsjWmo8t2kcWLHeVSIre68/P3nXZojQwFgvs/aQS
 KZxKOqsstJ3Vjk8vX7K9WUexixtQ3JfAfpYuiaSpMvQGP0RaUA7mvgzUajVqXS8Vu58v
 oulGQhkhcAzePP5oEvhigq+ITJ61eiNjJFq/GoYXpnX5Q6tK+nVWAsNLgnWn16iFBT+W
 XaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345854; x=1708950654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVcz4T5lUX/p2dpLrBnJfdqrXGy/EYfTfCTW6sdiHL0=;
 b=FwMqBolOLXF2ZFxvF3QLvyo2RC15S2Apjph8ITw4TcRGI+u/P1BRcE8eab1FcO7VN7
 bbiyslBMHCRroqhbCY/UleKczGHIDudp6XQH+szMyWVBNlkyAHo0P0EEgRFh8CRlcWSd
 fuFrtNk/CDHMCosKk29KQw2F7KW6UsqoJlzlpTqiAWcmF3LMwuyGiFL2IyI4qWtxdrP4
 Ytwtzf6jjJQ1gfp1VTpTt0sBQrwiqxSg/bOlUrIGWAosyrCIfp5P3H3lDQfXLuhDU9at
 51DcUaagkNd6fIr+YQvUuqpjDE6rNzLd5bLSHTfKl+kmSONcsrDGm/Yf7OIonRnf9Tzp
 MOKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf1wSIy+A7sRxVSZp5JE5MlCBl7NRNUbcJnOa06VojjfX2pDfh6pn2quyHOP8L6Q05t93g1PQMPMyXnphsGw6n7bwrsJp7WWcfLqe1dPGV
X-Gm-Message-State: AOJu0YwqsWQUC+mmskD5HCGCTFjihT6/+EZu+tshE2ZGMeE9IpwYVIjq
 sO8p+3NgpBjlHqBM8/Pk5pOZYSMzLWIyYMrh8MNXm8HqhWO1u96Ap6wO0BNujII=
X-Google-Smtp-Source: AGHT+IEPbgwbriAHQa/3aZrBt+n+k4H+sVUGdpUdH32pyxMo7FQlMDDN6LMaGZPj9i2Wa5EUvNTXvQ==
X-Received: by 2002:a05:6512:3b1e:b0:512:bccf:eb03 with SMTP id
 f30-20020a0565123b1e00b00512bccfeb03mr498859lfv.26.1708345853805; 
 Mon, 19 Feb 2024 04:30:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] drm/msm/dpu: improve DSC allocation
Date: Mon, 19 Feb 2024 14:30:42 +0200
Message-Id: <170834569499.2610898.923684601788968526.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
References: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
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


On Thu, 14 Dec 2023 10:56:12 -0800, Kuogee Hsieh wrote:
> At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
> However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
> index and another one has an even index. Each encoder can work
> independently. But only two DSC encoders from same DCE can be paired
> to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
> two consecutive DSC encoders (start with even index) have to be paired
> to support DSC merge mode.  In addition, the DSC with even index have
> to be mapped to even PINGPONG index and DSC with odd index have to be
> mapped to odd PINGPONG index at its data path in regardless of DSC
> V1.1 or V1.2. This patch improves DSC allocation mechanism with
> consideration of those factors.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: improve DSC allocation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/858ddb64f1ff

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
