Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C350AE1C58
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 15:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A13010EB62;
	Fri, 20 Jun 2025 13:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="foptFn1+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC34A10EB62
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 13:41:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-addda47ebeaso390109866b.1
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750426862; x=1751031662; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
 b=foptFn1+he2WB5jkrW5P76COgz8lnsbvEWv6H4eeUc8bcIjKpAgonrMcbiEJ7VVZKp
 OCnG526YfF/Xvwy7vMCODIYYTQyGxnzFvbPQe/XNEU59ROa14t5OchNGlGf51BGDcyGf
 Hbvqz3PpUj/251554ASpE+b2IMk5z/sSsRDKSy9GjDd2z6qTg9IxHGQEtR1z+nxtcFKw
 zAaXMF/olvTrsQgYInapl8feLCKV46CdEm9mnnB1oT6d83dKA6kLSFGpK/GvAzueufIp
 Jt5Lx8eMcXKIlLvuyVU9DyHCFJvpH0zfOVCf0l32qaWHM15j4OfBAYGEnRqalq1z6irS
 w5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750426862; x=1751031662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpVfOGJFxIZYsmMRUwFwqfFQVYB9k3K3K32rB5+Q7vw=;
 b=IahaxOzZAtfl7TDLTO4Gk1w8bI6FPAik4bhqCwBk4x7UyZfiwkfFDRp4s80rlGUeL0
 CvBYW2DOoEIBAMHszMokRbBkJG7zJYh0qKmhwHLPLZoAPQJvXYksOuOxf0JnMiB5OnSX
 BpaIsPjCn4zKpoLv2QN+7PjksIL/IqsNvkqqQGAM2I/f5NajOqKWsj0kh+KwZI7gyDIV
 6DZP1DhHpoUhmxoVo93eUT1tNyh5Or8Fu2HodKhf7Y6yRzRXeg1krFi5zUkq2jWrFwM5
 TKSlwFKmBPMG3WvVJOb1oTcUGdlH1C0GnTTbkZyP1HmMg8sq56B2U8lS7j4jwJe++vcJ
 TIaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoJKAteAdhu+3hQiFwDl9BTOt3005gQn3WVNbqfkQxt6Q3yUT8ITIpy9ODADdCt5/TEfxEj6LG+rs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyFQQf928ik0W4W0XEpeIGem7dib7zTR/jpUizVFdXN68KLurH
 TQZebiCwQ6iwKoZcLK5gxbDKRMBjmYCMRN5SNNjd3P0syD3Lwjf/y6Gfs7INBgSQyag=
X-Gm-Gg: ASbGncuufS0djOpxabY6LJrllzvCwnW7rYaL5BUaeXOJAMpE6UEFeTAWqbWGRrTnKTX
 GSjpuihH2cLe1Zr50uRNJotEBVqwOgg78YQtElJKIzW0EFrC9emv5dmyaaTJb6mSKpl51nxtdyS
 SYExWxAFVfPyts+tksfnkqICCEj/8mEZYLf6s0dLfNJnEvpMw0We7dOnCv/8C6IOZK4AH6mTwyz
 G+ow1ClLOhnY3jzdFjI72P/0y+zWe8fHNuG053RP42y42gX8PDrxlzYjUsruDgC6xe63UeinSCe
 NDj3WWT5JBDwn8ONDuF82Lf32DKY99QMC2Rh0RlkvoR0TwvmJ21QmWPhQkk=
X-Google-Smtp-Source: AGHT+IGYKKslvR/1stzFoNBWMle6YgYw/c/0QW8ncwoZLD0lcIICIhoOzA/vRygSUJ7ruQCVGYAWdg==
X-Received: by 2002:a17:906:6a19:b0:ad8:9466:3344 with SMTP id
 a640c23a62f3a-ae057b98feamr276291966b.43.1750426861719; 
 Fri, 20 Jun 2025 06:41:01 -0700 (PDT)
Received: from linaro.org ([82.79.186.23]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054080a98sm168650466b.90.2025.06.20.06.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 06:41:00 -0700 (PDT)
Date: Fri, 20 Jun 2025 16:40:59 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: include linux/io.h
Message-ID: <aFVk6+4pIMQs2imz@linaro.org>
References: <20250620124747.1928114-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620124747.1928114-1-arnd@kernel.org>
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

On 25-06-20 14:47:43, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver started using readl/writel, which are defined in linux/io.h,
> so this needs to be included here:
> 
> drivers/gpu/drm/msm/dp/dp_panel.c:33:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    33 |         return readl_relaxed(panel->link_base + offset);
> 
> Fixes: 9d47325ee063 ("drm/msm/dp: drop the msm_dp_catalog module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
