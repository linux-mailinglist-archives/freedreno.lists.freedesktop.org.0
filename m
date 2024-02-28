Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC286BAC4
	for <lists+freedreno@lfdr.de>; Wed, 28 Feb 2024 23:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86C810E0E2;
	Wed, 28 Feb 2024 22:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Zq+wRQXn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0377610E0DB
 for <freedreno@lists.freedesktop.org>; Wed, 28 Feb 2024 22:32:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso2949971fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 Feb 2024 14:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709159558; x=1709764358;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=4heZpp/8xaL9FF64v4iIiRVohxYlLTlgxw9EvqHEm0U=;
 b=Zq+wRQXn7Rcp1GlejbMknHlRNnI/TI3hTWP6ovSOBovDXBZR+nznSFb9vcrbpbHfvP
 RfNzXpZ+HTbMthZLFevCfczXk3pgd+I8jhJVHLqxqGHP1Yi//UwNNwd2bRHqT5s8B/vU
 97JAmbo49O4vOakAGTaSTu5tSnIgShu0yKhVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709159558; x=1709764358;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4heZpp/8xaL9FF64v4iIiRVohxYlLTlgxw9EvqHEm0U=;
 b=gAGI3AtKPkC3XsyFOVyewbRnwvXNYeO8PJKpRgAHhIdz95PwhKlQj3j8X/AO4z0s72
 hcI4irbdfo/6fFycY9X1Sa9wKtS0dlUBK9JMTelpN5XWRwnBryeF2J06vlgbzAu/IFmO
 Kdh4totsYs0AgUNVDKzWfNi6bG3yCgPVlNPIcgPTh0FSVDul4mG6vScHOBGnHZ+OlgT5
 LHST/50ojlKswBstQNwgifzaioBJQTg/74BDGvbOB36kwfv9+24UYi8m6i4SJPIRyP0N
 xh6JeOaVng7MyC7H0j2C8MEgcVcoj3k55SBQCbjVRA/DQ6s/F6hFkb5mHK3UsFL3sEo1
 M+JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/ci7s/+o5VKAGmV7arGG2FZU1i+7TrPKSbCEhv7glwJK6SLm1ZmdeHRluwDel9gSo331pydUkuGzoHc2mn82rrsqEdRe1B038UcJjHi0N
X-Gm-Message-State: AOJu0YzlRJmMl8WWqnoT2A1QWBz4zlePr6NDYRW294Stj596ctWfHYC/
 Vxf3k1smYXv+imN7+sSEjah8WaSYdFvhn123opZnhNshq613Vly7PhDWvKMrN2EvSvq0lLC2Tz0
 ztZE28TCS+Tf3qP9rEbASGROpUNfZv3eVVtUA
X-Google-Smtp-Source: AGHT+IF8m5eUpgTa0zbHHmuuse1uPPlb5cH3BKyK6w6U3t5iw9hTZuDz5U5AYc4RAvuOLPpkAFPsDX9RoXeg8idDs9k=
X-Received: by 2002:ac2:544f:0:b0:512:b3ef:350f with SMTP id
 d15-20020ac2544f000000b00512b3ef350fmr151977lfn.49.1709159558498; Wed, 28 Feb
 2024 14:32:38 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Feb 2024 14:32:37 -0800
MIME-Version: 1.0
In-Reply-To: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
References: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 28 Feb 2024 14:32:37 -0800
Message-ID: <CAE-0n522_pS0ructcKgbNY6gNpfn=s+83ha94N7A16adq0OoRg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix runtime_pm handling in
 dp_wait_hpd_asserted
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
 Sean Paul <sean@poorly.run>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2024-02-26 14:34:45)
> The function dp_wait_hpd_asserted() uses pm_runtime_get_sync() and
> doesn't care about the return value. Potentially this can lead to
> unclocked access if for some reason resuming of the DP controller fails.
>
> Change the function to use pm_runtime_resume_and_get() and return an
> error if resume fails.
>
> Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
