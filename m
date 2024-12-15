Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7429F2414
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 14:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C94C10E386;
	Sun, 15 Dec 2024 13:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d5c+/AMe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941F10E386
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:51 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso3257945e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268250; x=1734873050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awxvmFGu6W8HI08GuYqSLCup3VkCru3mT3zlTswkMMk=;
 b=d5c+/AMe/VlFaXLBwz70OGgTkAPHc1oVhZqIZi5VAASZWf/GIc2Xr93JRYObetaOGN
 rhwGkz/EgGRoaDbNGeVXv4B4AC2f4pAtN0RxWiSR0BN7NuJ2WFAWDEmX0MrOTw6PoyAZ
 r6vifM45mYc/eKaC3wtnAWRxA9b0S1WmyvbFn16+sDoQ0ZeZKpQs2S+SMXIQUFd2RmxN
 Lle7hIPFuC2h9i+juz+Zi490Yzq0it+raRLqd6OIjlXjU3GQcxBcaUWp+KGxEBCQW4v7
 S6A4BYDmbifQ/952lQF+8jmGHDnAv3c1jrUZ8Lq3T1tmp871lzvk18hjZxDOlLROzENn
 PqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268250; x=1734873050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awxvmFGu6W8HI08GuYqSLCup3VkCru3mT3zlTswkMMk=;
 b=QBvDq6Ip1UEL1abjipiLBziHL5DnAr7UkfvWI4GzP9bDnKLtsXmPWJ8UUzA2bwdBVp
 3zhBi+E9eVaS5S20Nagr0MziBYWipQvLGCqQBBhKrMGd4yMLl0HkdT54aLuY8ruk/YHm
 +3bP28Zc8YtN7V2kL0B84g2N3kpFt7i6wc4aSRNx3wDTTK+WvqvNrZ1iKAirOZloV1Z2
 rPYdOASiTP4tOoqvm8hY6M0mPnqO7ZzAlL8I8YkgHhsTAp/cIQkKqZyIfuTPe0qxRcGD
 4jgR4/5DP/3zxxeErnGYVmZVaan2RwOZN6Vwb/aTqAv1dAwp1/ipcfMxa/dRvaUtfuNs
 Q0/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8o6QVMQpNAN3GzoQiI9Hb1Locct/x4URLrRO0kGYhXPDUvfSB14MvDpZl3rbzHKuqf3qLGRDlOM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1JEgVhoBPNJPHXtIpfaBzPm5ZUW8vR0cdQePNpWkrRflhdFkF
 ngxvhNYSBzqp07YlF1Vx/g0+Z7cin+pOWu/Ol5xEeoAQhEGEezFwZ0W7utTEcLGA413hJZSlRlA
 6
X-Gm-Gg: ASbGnculeLaPgnSwzgw/fiVY+hhgHyKcDW+GJF3GOxQzfJ3LkXeXdNNl6LG46vck+He
 7NnsP95vHfna7C5n1YytV2yhMzBoxhjWfSEBc3jpuPnckv53gdIrVTWdt8oTy5Q2woWo/SzB381
 XADU+ltdZY8z/QqSOa6n6VbDi1jVxZYcBKOMDfHw9MHAvgZDoz518TaAPVmb2h/gc7+McWeuTHV
 /FxtInWmVpLqhOQIscc565oL7CCcajWz6czoZuuUM2w12e/sJDjWa8IKUrfR4hQwMsVKkOI
X-Google-Smtp-Source: AGHT+IGrNf/u7LsRewYNxdnxXQOGY+8iY4gXe3eVKZbdSNgIMmlapF4Yec2PrHTH1Kv3kmEvwc4VkQ==
X-Received: by 2002:a05:6512:3a87:b0:540:1d6c:f1bf with SMTP id
 2adb3069b0e04-5408ef55f89mr2518182e87.11.1734268250087; 
 Sun, 15 Dec 2024 05:10:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Date: Sun, 15 Dec 2024 15:10:41 +0200
Message-Id: <173426667308.2196979.9157253558561897505.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com>
References: <20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com>
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


On Mon, 09 Dec 2024 13:18:36 -0800, Abhinav Kumar wrote:
> On chipsets such as QCS615, there is no 3dmux present. In such
> a case, a layer exceeding the max_mixer_width cannot be split,
> hence cannot be supported.
> 
> Filter out the modes which exceed the max_mixer_width when there
> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> to return failure for such modes.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: filter out too wide modes if no 3dmux is present
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dbc7bb1a93f4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
