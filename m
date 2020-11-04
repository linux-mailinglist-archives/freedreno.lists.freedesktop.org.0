Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E374E2A5CDE
	for <lists+freedreno@lfdr.de>; Wed,  4 Nov 2020 04:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821A6E926;
	Wed,  4 Nov 2020 03:04:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE896E926
 for <freedreno@lists.freedesktop.org>; Wed,  4 Nov 2020 03:04:00 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id g12so15314389pgm.8
 for <freedreno@lists.freedesktop.org>; Tue, 03 Nov 2020 19:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=M+7yANrvElG7vvXiOwG93dIUVBVs3AW4QD34DhOvCCI=;
 b=btFJkwgN45cTDxVtmE+Vf/+i4KTd+QJ7t7NUxCyZTE8m1tbcZbzqjNbBGYprvd57iN
 UShejiWVREUTlyzMsd8UIEC1n3FLdTx5oKihlzv2zQeOYrsmRCZgIbcc6awaLDRftLtE
 zXyerpEX+lcba+6EjdtoMaErPXzcXtWX9M4Y9iH8f2tOBVl07bUpcttN9jtz5woiWfKs
 E+NHYqOnfFZuFluN5f3wZdCPeP0xl5bojj8vXL3BjMJXkdIgBBDDevUeORWDZDPkDzVZ
 H2onAvXjL0GO/VwttnAAAPMr+4GLy0YLVKE1PsLXoA6a+UqtctBYVCJ+sIAt5sIl2M7Z
 d8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M+7yANrvElG7vvXiOwG93dIUVBVs3AW4QD34DhOvCCI=;
 b=knOolZoND9EtfxcYU9fgd85sW5nFXhKdVjslljpEyUhvjF9JUotm7I+y8qEQx4M2Yj
 BaX7SirzQveK245pkwjWUmZQIKrZoA5EMTt62+9NvztPhHuSa9U5qlVVBCz9Mekr2fHs
 KCfxRO8LKbJ3wFJRFcuE79nqZR29m+oiQ38RjDyoZ1CKxFs+68/Czj8urzWwYfIi01Da
 754/xXJytxtlq1FQcpDw96gLiRQjhH6x+hKbf2qsBfmHNAGePMagPKl73hq6DSNsn1UV
 Eu9Kp+khyzOMkn9hGWSLBcWs0T9gRxBQ/HHUeA9j1hVZAuZsWZM8MoxW2yM67/RzLmmY
 t/+g==
X-Gm-Message-State: AOAM530q4+xG8xbejkJPJL16HzjTSDAciouzIxN1mH0UG8dLvJjrst2L
 v4c/PgHOMENDBnrL6wQQKM2gqA==
X-Google-Smtp-Source: ABdhPJye/niTkH7khNS36zvZ3Ubb6lzZ6FDeMgMpWSwwwaQ4FeRK9FDZcZ/yYMErd1iByJeq4uoX+A==
X-Received: by 2002:a17:90a:5882:: with SMTP id
 j2mr2156165pji.177.1604459039793; 
 Tue, 03 Nov 2020 19:03:59 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id n64sm491754pfn.134.2020.11.03.19.03.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 19:03:58 -0800 (PST)
Date: Wed, 4 Nov 2020 08:33:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
References: <CAF6AEGstGtBswUUiyHxT2cCm8NwZekDnMzD0J_pQH37GwS=LiA@mail.gmail.com>
 <20201020090729.qgqish5kqamhvatj@vireshk-i7>
 <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH v2 07/22] drm/msm: Do rpm get sooner in the
 submit path
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03-11-20, 08:50, Rob Clark wrote:
> sorry, it didn't apply cleanly (which I guess is due to some other
> dependencies that need to be picked back to v5.4 product kernel), and
> due to some other things I'm in middle of debugging I didn't have time
> yet to switch to v5.10-rc or look at what else needs to
> cherry-picked..
> 
> If you could, pushing a branch with this patch somewhere would be a
> bit easier to work with (ie. fetch && cherry-pick is easier to deal
> with than picking things from list)

It has been in linux-next for a few days. Here is the HEAD to pick
from. There are few patches there since rc1.

commit 203e29749cc0 ("opp: Allocate the OPP table outside of opp_table_lock")

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
