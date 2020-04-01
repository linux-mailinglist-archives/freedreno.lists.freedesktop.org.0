Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7319B792
	for <lists+freedreno@lfdr.de>; Wed,  1 Apr 2020 23:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD5D6E9A6;
	Wed,  1 Apr 2020 21:29:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100BA6E9A7
 for <freedreno@lists.freedesktop.org>; Wed,  1 Apr 2020 21:29:04 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id s23so476966plq.13
 for <freedreno@lists.freedesktop.org>; Wed, 01 Apr 2020 14:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cTFpqA5tG+WWT9sTreQ1YOunwJV7A8zTcn5uhSzjIZ8=;
 b=m/yww7rDfQ3kktZhAjrnmc6g3M4Vsz4wORWt61gOe6FYkfHbNCzUioxpSDF3MPmBdV
 Wz+TOWpWbgLz2bg1u9mPRpg/hmCCA6zHm4OXJnKbK+jRgPKHnQZcf9KXcaH2m7MmbV/r
 RdUAXoiZP27scBBR04rsv7Id1hAiTQjJ2EeYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cTFpqA5tG+WWT9sTreQ1YOunwJV7A8zTcn5uhSzjIZ8=;
 b=FNNM3W31TZg2mE4x5FZOSzc/X0g3Y0l7CH3pSPVovAwEA6iUwsHfKe0OnmN/ltbuav
 mFIdLOPR+wLYVGBwDjUXLWKMgFy2i2FDOryprrQAUqBg1klNoFdYBam4Mt7Vbosqf1+G
 D3hSs7mpsn7SUPgsInE4Ad3J3fsOG+KonDTGopQ+TdoExoHJpWP39/omiSy1jzgc6f9s
 vurrRF1qa8zyunD/ou5VPXBFGkALEZNnuQjC2yzlcMQ6YIj/lNXHmX5oHP/vooi6db9F
 eoIVte1undp13zfmD+FZ3GQW4C6X/yu8N22IUflHG64PCe5axfthetwmBiAof6uKruyN
 PHXA==
X-Gm-Message-State: AGi0PuapqAZqM1LLIvPB3yqaNJRgFdkityr7Wszdcdh5vrJPlBEl1BIL
 daDh2LWlfEiyrnKFyyd/bM9EhQ==
X-Google-Smtp-Source: APiQypLQF/i0d5RT+vCgKNX8CwUXkL5ru4KsrEREbSGlX8uxuXDitKjdh2D609gtDGT9DRBZaS55xw==
X-Received: by 2002:a17:90b:4910:: with SMTP id
 kr16mr5297pjb.142.1585776543567; 
 Wed, 01 Apr 2020 14:29:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id d3sm2337317pjz.2.2020.04.01.14.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2020 14:29:03 -0700 (PDT)
Date: Wed, 1 Apr 2020 14:29:01 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Message-ID: <20200401212901.GN199755@google.com>
References: <1585732665-29492-1-git-send-email-mkrishn@codeaurora.org>
 <1585732665-29492-2-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585732665-29492-2-git-send-email-mkrishn@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [v1 3/3] arm64: dts: sc7180: define interconnects
 for sc7180 target
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Apr 01, 2020 at 02:47:45PM +0530, Krishna Manikandan wrote:

> Subject: arm64: dts: sc7180: define interconnects for sc7180 target

Please be more specific about which interconnect entries are added.
Also no need to repeat 'sc7180', it is already clear from the prefix.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
