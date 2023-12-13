Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE528106BA
	for <lists+freedreno@lfdr.de>; Wed, 13 Dec 2023 01:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0340F10E234;
	Wed, 13 Dec 2023 00:37:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C319510E234
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 00:37:42 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bf3efe2cbso7296316e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 16:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427861; x=1703032661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyawuRNxUOJx4krMuVIPeAGsZD64pCzULSxldkl4c04=;
 b=Nt1btbo2Z9x+SOF2HdHOOCgZFM0NafC+w3teQecF1qWOia+GQdWPNO15SADEdZ2kz5
 oOEK5HV2nH+nF3v4fcwn7Pl4vGtvGEUua1k+0pGwUxSTYzqsYpLSiMCZ2saPLCX59fXK
 WE/oYGZuRAU3R64oSTQExYeC40n55iJhKy7EZHxoS/lnZm8yqWInfTEHbd3SYswoH3nc
 bYYbbFLMFYyqsGhiWZ51oz2Qh9UMrEx1rXUvcsbdDliYjFMJzJndzUvqGeRzu0h3NZK+
 HYnLArUBLX6dCD0mFA5DL8DhtFwO43ysqyuDwCTswYmvi6fhr1Z3pBQTqDAAQ/kZftuy
 iwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427861; x=1703032661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyawuRNxUOJx4krMuVIPeAGsZD64pCzULSxldkl4c04=;
 b=cbsm7SfjQYWPLTXXB3lfVlk+s0Thj5Yw0WOJAT6Fwf1eASLQQFnP2EZyKPB+iP8KTp
 NpFqZob/obIRpVrPSMn+a5MmprfXz/V5R4WyRUBPeUeAPkl0TCnHHnVbs/GxkvlYAhp0
 OFLGvyhgj3bbhRlaX8kQMBM7YIe7Vc2pQAQfHqCWK4zEMl8Do8elsHIrCrQVibmVmdpm
 Dbb7F3sRn5cZUMZFHqPc+VaNK/VkGWc0qcjWYZcE9La0hNCCvBXSw4niLHVVBphZhvnx
 LdfUky/KS68eHaG+V0xO+g+WfQ07ZyEcVhj5M1EgQT5rEmDNvMduJAAnJR/rD7LWlQZg
 GRtw==
X-Gm-Message-State: AOJu0Yxm9PkDUEuyr3Mzq4mfzndQgJkMEC76Dg8HuA8yuoalJn2Qw0Ia
 Z5zmbuZ8nQpA2qwGHUZH1UzIzg==
X-Google-Smtp-Source: AGHT+IELJg6xtBV3YwWzHW35+oAMMuqoqq9emUlpwuefa9mMo13YdC5VxvXXbHCtbJlZxVgL/oczQQ==
X-Received: by 2002:a05:6512:12cb:b0:50d:1a52:7760 with SMTP id
 p11-20020a05651212cb00b0050d1a527760mr1929464lfg.149.1702427861132; 
 Tue, 12 Dec 2023 16:37:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:37:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Ratelimit framedone timeout msgs
Date: Wed, 13 Dec 2023 02:37:34 +0200
Message-Id: <170242755506.12964.11418268791653188536.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211182000.218088-1-robdclark@gmail.com>
References: <20231211182000.218088-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kalyan Thota <quic_kalyant@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Sean Paul <sean@poorly.run>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 11 Dec 2023 10:19:55 -0800, Rob Clark wrote:
> When we start getting these, we get a *lot*.  So ratelimit it to not
> flood dmesg.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Ratelimit framedone timeout msgs
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e37cb117b819

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
