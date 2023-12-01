Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A27801792
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 00:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCB810E183;
	Fri,  1 Dec 2023 23:23:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A216D10E985
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 23:23:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2c9c4df1287so36250251fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 01 Dec 2023 15:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701472980; x=1702077780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mPB8J9KOLgFvXqw1rydMIKNrEURsJRhisRvaGx5Qvo=;
 b=ONXyDMycn5lU8wrVgcLKqp5bP44zbgejKdDCTiXgNC5yj+NyQvBfb+aqv9yqou7gGX
 gByI4NkBYR7MtAbp+smYltVn/EAM8KY4HzQdpS3YPOWiIaz5FGbhm0qwWQ78jMPoups8
 vM/vtv6E4R8+1lZYJEbiHfLEkS5BFbcYQkW7gu9jAWmJ7LPXNUagqIxNkwp3U/8hJ232
 Q5iW2gAsI3b4tFeXbDEkJMreGvC12aGPo1Mkj/pRWgXqL53gMryMm0DXwpx8MpXQQ9qO
 iBEUe3JCeQyFnfXlTH+NNJilQFxtiEjnuWJ7laWYn6/Q7F7buXsdRn3xXUD7b+xEyQ/S
 +A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701472980; x=1702077780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mPB8J9KOLgFvXqw1rydMIKNrEURsJRhisRvaGx5Qvo=;
 b=NyMk3a5hLvkgZASJH0N+2tMguANq2tEyqKQTwk6f52TTUTonX5kbA1jSoijp7CyBDp
 vGzffPNK4WDwM+Y09zV4WtMHzeGUtNeZhlmOFVzb0hAsY1KFDcmh1YHScO3l6qkButI+
 33VFk1uJBzHqy9POn+KnwHLjE30+2d6WmfjnxB//Y/JScG5a5Jp4rT+EKz9cktTm2fvL
 wCmEXnrLNpVtlv3GAW27iZzG5xdm74yJi/eLjqq4UGxSAkUOrNCHgYpXmnWpofjjccK9
 ovOfhxdJd41T0IOJK/QZNQ/OMGItC8xnYswRJfq8bO/zTmzJ5/vWo5NrlJPuVoUpgJ2K
 SRSg==
X-Gm-Message-State: AOJu0Yx7ybJ7aSgNEnnS+UdB1Wsh3lKVg1Z7ZqbJ/n1sngi8lZSzu8ep
 v3f9xgUy6krDJaX+HOGCz5PBLQ==
X-Google-Smtp-Source: AGHT+IEwZ3nkP64SLpV3NkvgH1lRsLPyZfl7SpQBWnCAVSDtZo0FcR829DhEkezYz+K6KxEhUMKjIw==
X-Received: by 2002:a05:6512:313c:b0:50b:c768:d347 with SMTP id
 p28-20020a056512313c00b0050bc768d347mr1292282lfd.18.1701472979687; 
 Fri, 01 Dec 2023 15:22:59 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 k10-20020ac24f0a000000b0050bcb5b443dsm549662lfr.171.2023.12.01.15.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:22:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Date: Sat,  2 Dec 2023 01:22:56 +0200
Message-ID: <170147278460.2064169.18443996473333750316.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230823215458.203366-1-robdclark@gmail.com>
References: <20230823215458.203366-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v9 0/3] dma-fence: Deadline awareness (uabi
 edition)
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
Cc: Rob Clark <robdclark@chromium.org>, linux-pm@vger.kernel.org,
 Gustavo Padovan <gustavo@padovan.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 23 Aug 2023 14:54:53 -0700, Rob Clark wrote:
> This is a re-post of the remaining patches from:
> https://patchwork.freedesktop.org/series/114490/
> 
> Part of the hold-up of the remaining uabi patches was compositor
> support, but now an MR for kwin exists:
> 
>   https://invent.kde.org/plasma/kwin/-/merge_requests/4358
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/syncobj: Add deadline support for syncobj waits
      commit: 8570c27932e132d2663e8120311891deb2a853de
[2/3] dma-buf/sync_file: Add SET_DEADLINE ioctl
      commit: 63ee44540205d993854f143a5ab1d7d9e63ffcf1
[3/3] dma-buf/sw_sync: Add fence deadline support
      commit: 70e67aaec2f4706df0006423eebca813b00f5840

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
