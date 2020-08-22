Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E91A24E46F
	for <lists+freedreno@lfdr.de>; Sat, 22 Aug 2020 03:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D136E12E;
	Sat, 22 Aug 2020 01:20:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732DA6E15E
 for <freedreno@lists.freedesktop.org>; Sat, 22 Aug 2020 01:20:21 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id g33so1800892pgb.4
 for <freedreno@lists.freedesktop.org>; Fri, 21 Aug 2020 18:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+grt2lq7z6Xfwjj3obNToZK2iikIyYEevhepcH8Y3zA=;
 b=K5ahScP0ndnTcA/McyN9stxj4UZT171xHGRjMWbB5W8cDeTg/1iLTqmTGsaqDu0fiK
 rfF4DBi8OBRUiMAZBtP8Qx8amcB9RrJEwsC86I3XR89LNYY/IO64eHSPHRS+LFrZIFcj
 HxA4U4qMiFI5/bRQZbT4d6+Ss8gvk4W2oqZeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+grt2lq7z6Xfwjj3obNToZK2iikIyYEevhepcH8Y3zA=;
 b=SynLBQFtxDwxng4C2uwnzNkF/tN0aBIMl7kKvsK6Djwrz18ybA0aIlDLzdHz/uYnlq
 SASC1t6SdEkd8VndM5MJylnN4zdnmK/MRbbGlW0/3V0hR0PzVSIFEBBHXnYo2Au1rZYg
 7duBnnOQTnxqMlN6RchOBtek9S8hAn6RSLmvVm47lSmZxEGR7EpZEtP/nJc+R0Bq4ub7
 9DgtJorIYDhKecNWIPNubhM9aeskNFP88+p23ZzT0poCSWnMtU97/eUFlzJDu5Ce5xRa
 joXZUKfs2a1wLMfyLmMCh/d94DDulNvXprcyyev4+cB40NqbOE0nFHipDmr0t3SqaGWi
 2GuA==
X-Gm-Message-State: AOAM532nMwLRuelkdmU6uQbsdUOtzp57TN6/rFy+Zw9cjJdK4hM+BMil
 KvcOTuB6aBP9DIVS5a0YO/ePRA==
X-Google-Smtp-Source: ABdhPJyy/NybCCraoY2LInilmxjLXa17wS6eM5dZSb+zo1iqkBgmWudnyHSBaYln4qN66CDjiBjOJA==
X-Received: by 2002:a63:4b10:: with SMTP id y16mr4067214pga.93.1598059220930; 
 Fri, 21 Aug 2020 18:20:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u8sm2912191pjy.35.2020.08.21.18.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 18:20:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200818163119.715410-1-robdclark@gmail.com>
References: <20200818163119.715410-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 21 Aug 2020 18:20:18 -0700
Message-ID: <159805921877.334488.15322995741035336582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm: enable vblank during atomic commits
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Clark (2020-08-18 09:31:19)
> From: Rob Clark <robdclark@chromium.org>
> 
> This has roughly the same effect as drm_atomic_helper_wait_for_vblanks(),
> basically just ensuring that vblank accounting is enabled so that we get
> valid timestamp/seqn on pageflip events.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
