Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301562AF7EC
	for <lists+freedreno@lfdr.de>; Wed, 11 Nov 2020 19:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5BB6E072;
	Wed, 11 Nov 2020 18:31:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71B6E09C
 for <freedreno@lists.freedesktop.org>; Wed, 11 Nov 2020 18:31:25 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t18so1425416plo.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Nov 2020 10:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=wD0jJ9X64mmDYkYQXCPtOUmFoXPMN4LsIkpG0z5TLc4=;
 b=XNGMe8UIGU4UjjWGJfO7UCoPXJ/HXS48uim2rwQL/5T5pZKMxDtsYw5UhdBzAsuzga
 hcXUEg5BuNcET3U8EHMparmQNn5KFUqSYuMDc1A4PXs0JlhU00TdoW4BTQAQ3/TzPV3r
 lFzbnk1EO2Hs3WEaDfpSjwnjXjwAYz6U2lXUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=wD0jJ9X64mmDYkYQXCPtOUmFoXPMN4LsIkpG0z5TLc4=;
 b=PnFq23pu5d+9Fz23wzu3QcU42e2ygMuajCUn3a7rJEHUU5wCr/OgntQ3NBH+lSS+7s
 00P73so8VUL6ovrjBxkd8Zf9mA1zMV+TirptyNYc9wG6TDnqgqaNLpoaRV/vqOTc3PE2
 JNPk9sgZUGEY0unczclUv1uMIvQU3xw1Lk0G73mDTOJT6tSjMtc/5cwCTd8WMsg67h4+
 zNrqkYYc6ije2eR5bNGk/bQeV9zN3UY/emVihhiSLZQ0jodsfduAx8udkC4/AnomhMlB
 J+M+85O3odjA7wogTEmsQU0X3Qgxty8833nO1TKEfXdTVc7Ni1nJlPoxT9UoWkT0Ag5K
 bNnQ==
X-Gm-Message-State: AOAM532Y0utc3tJocNxsUSPLALQM3ktBFfVkW+mUULnnpB+GTAmxrWif
 XHBL7EIvru7EdGyJH/nr1+WOqg==
X-Google-Smtp-Source: ABdhPJy09cg46m0g6zOTsBCTeks5xXNo/nK4uXKQMsNVoEVAyVBE7tfR8Q5SwMX43YYdwEDvK5ynlQ==
X-Received: by 2002:a17:90a:4dc3:: with SMTP id
 r3mr5029168pjl.155.1605119485287; 
 Wed, 11 Nov 2020 10:31:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id h16sm3018890pjz.10.2020.11.11.10.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:31:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1605081476-27098-1-git-send-email-tiantao6@hisilicon.com>
References: <1605081476-27098-1-git-send-email-tiantao6@hisilicon.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 robdclark@gmail.com, sean@poorly.run
Date: Wed, 11 Nov 2020 10:31:22 -0800
Message-ID: <160511948264.60232.638230439536068079@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove duplicate include
 statement
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
Cc: tanmay@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 khsieh@codeaurora.org, abhinavk@codeaurora.org,
 freedreno@lists.freedesktop.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tian Tao (2020-11-10 23:57:56)
> linux/rational.h is included more than once, Remove the one that isn't
> necessary.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
