Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DCC9ED971
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DDC10EC3C;
	Wed, 11 Dec 2024 22:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cCTfPckH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F9110EC39
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:18:21 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6d8f916b40bso63798276d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733955500; x=1734560300;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=0rt+LftUaiIAtV8Lnqx/UsM/DKwcWcCSJ7gULGGysG8=;
 b=cCTfPckHPpoLuPxL43NhIpCdepdQEEX4ufesIDd/PwUDyJBZdjE1gmI5U3Sy2hXd08
 +OKWuKhP81e9icAF/MoZB91rIEAcpLlMBVgHA4EJyGp7EX7srZhT0VIcuKW2r6rq9mgm
 eP2K0yw7UmxMYniQG6S5QI2WI/NKBuRktMKLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733955500; x=1734560300;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rt+LftUaiIAtV8Lnqx/UsM/DKwcWcCSJ7gULGGysG8=;
 b=Oj4nKcFO9A0D5Q0zbINGYPm4dwvrthLGeocQ6tUkedKBcmIT6gjB1k5qVAMI1GpNJa
 p5i2UZ9HskYQST/6LQL36giuT3w99Syzoe66qEv0anP0dPcehWsiwbTOA1YFODYQ/Pz+
 lyoQt+UYGUY06Fu/VKXmmaY5hM0o0XLn87xXAsDITbixmS1SrU2RnO7yYD0V6/kCIpFv
 7aXYywodpxecS/j5jkLQotA1XkWst7QSdB+G0SFFOTBrftDdI1snIgsOw9qM5r35ks1f
 reH5q+Iek1hbLwmU8mZI6hfmmKtgNFYyszckd6EIiesS7ktDTYlWky7sFds4v5+9xeTb
 0E8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNDIiTQKIdLwVVRudl0ZezEYmE/lfI+OoI3sjlgfxjyNRbi70Vj5MRFpVLc3j1YGulmoW7Xl0KdMs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5M9FEb4Y2c5fZ3AZP5/J8PwcNWd+3e4mT8s2itdqtb0giPNV2
 3PIwPGE0Rsbva64D5NTseh/BByFCnmUSp+KPOYmd63IMtb1rxWrSq8D+Us2saaWe49I/kJFvcS0
 pFyFWbH2Y7NWB/OkodRmUfDCC5DnR/zI0Ccyb
X-Gm-Gg: ASbGncuzjz/Me4BeRg2tvpZkhEVYY5knvzLBrBhn2khIRWhlYM9S+HzLNMAMawR/ckd
 x54j7ts9LZOfnlDEI7Lbo9APc8B3H7tfcP8Gp7AGaPHJ8561OVC2rZ5mVAUqS4x0=
X-Google-Smtp-Source: AGHT+IEh22eo0rd7CRUaBnizbOTPapamAsVOnD5oqCjCeDY0vRSnRalP/VlK+LQ2LP76cy7+yeYmUI+Cf2UJpD/kvGU=
X-Received: by 2002:a05:6214:d68:b0:6d8:8e0f:8c03 with SMTP id
 6a1803df08f44-6dae38f5720mr18047506d6.18.1733955500628; Wed, 11 Dec 2024
 14:18:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:18:20 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-4-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-4-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:18:20 -0800
Message-ID: <CAE-0n53V9xmrktUBpfNd9Me7pig=c3sP1AcCPdKnpDd-RSuakw@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:34)
> Having I/O regions inside a msm_dp_catalog_private() results in extra
> layers of one-line wrappers for accessing the data. Move I/O region base
> and size to the globally visible struct msm_dp_catalog.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
