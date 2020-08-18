Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09924904E
	for <lists+freedreno@lfdr.de>; Tue, 18 Aug 2020 23:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F7A6E192;
	Tue, 18 Aug 2020 21:42:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55A36E191
 for <freedreno@lists.freedesktop.org>; Tue, 18 Aug 2020 21:42:24 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id s14so3859626plp.4
 for <freedreno@lists.freedesktop.org>; Tue, 18 Aug 2020 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=e5nsLglQi6iq0gXD4/ZLbxZPHmUiCWsoxGRyVuLjB/c=;
 b=oekTgrwzSs/TnRji4n7Ia1KRw2sKFuCY6qwuXQcuT84qxYNIQBTvSVH5zSdQoh3F1L
 uAmAKAJagFUtKA5NCI6262idBc6YE3mg3C8P5KXEG9A53xdLiIZsbpEfCEA3ovO+r+bw
 D1Dbnfw3JW6d3gniWTVyrMYPGrYKyffZ21TC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=e5nsLglQi6iq0gXD4/ZLbxZPHmUiCWsoxGRyVuLjB/c=;
 b=of82HcpiM7fdC4yBTWI2zxGMgM+n+2V5JiA15D5mEI6XmxUY9Xbtg6Xh80YUEphtK2
 G26iKoOw8xw4YijDBREYOwj7P7ZRVJbrYULDDObW/LADW0jJqoLmGKtKQ01noRAgzdzg
 BNAL4LAcPn4QJKxpdMpREpeWKArTay8LfotgRzkvwsbRdUkx+28qB6Ayv1HtoBA5Focl
 EMBcCFJFlSQHV1cz7AZck8eOk/b/nlY4VdVcHn6fwYv4uCLPatgbCXXWsaOsM1JbtD1u
 Io/92L+SvGG1rnnyRTiK+tDworG15bHuRJQy57rWThPWIRJY992ERpZiMFKxFVxYV2RW
 tz6A==
X-Gm-Message-State: AOAM532rNceYPRZ1g/6bioCTAtUuMJJlUg4rjQL4sU64G8Nz3UhzN74A
 it3dUsqogCLIus0gDQlNWDLB8Q==
X-Google-Smtp-Source: ABdhPJxNWxWkdy4uYKtZpGauvgOCAqO43bYBYkbW03fwXdZ7RgGCLEOkwT4RULfvoamziaSpULpFwQ==
X-Received: by 2002:a17:90a:d597:: with SMTP id
 v23mr1471836pju.24.1597786944417; 
 Tue, 18 Aug 2020 14:42:24 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id e7sm22363954pgn.64.2020.08.18.14.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 14:42:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200818033657.16074-1-tanmay@codeaurora.org>
References: <20200818033657.16074-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org
Date: Tue, 18 Aug 2020 14:42:22 -0700
Message-ID: <159778694245.334488.3352871644651964381@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v3] arm64: dts: qcom: sc7180: Add
 DisplayPort HPD pin dt node
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, robdclark@gmail.com,
 seanpaul@chromium.org, abhinavk@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-08-17 20:36:57)
> This node defines alternate DP HPD functionality of GPIO.
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
