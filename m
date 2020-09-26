Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B9279791
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 09:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828D46EDA6;
	Sat, 26 Sep 2020 07:40:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49FE6EDA6
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 07:40:03 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so642793pjb.0
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 00:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=qRaxhiyZE90m+amIVHIeCMA0LL3BWUXSOy1qHRMz/HE=;
 b=REsQD2UwdR9mJ2mZr8Lka7ng3h1M5e4t5YBSNhbSVEe4dBJq1XzPkdnga8WsA4blA7
 enldgWNaqTvjHUwuEuZ8zTdyodiiex2GstukHEm8QqFfnaUL5b2Qp+86p01XKfBONkbv
 94+OWFKFNefSgIloF+EIod5O3TihXi4rkG8pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=qRaxhiyZE90m+amIVHIeCMA0LL3BWUXSOy1qHRMz/HE=;
 b=EktnTbySnvuy0MD1nPWSdwFqczdTSENA7JkW7LLQn+/1OJ+VTGdv5Fis4hbE4pmPet
 ZYW3jRPXlX/bMlg1GfpiDfTG7dwCI7S/WPdHstF/Ic+eW7W04Lk3EynV/5qZcW1DaF9d
 9JG7VTfYVHKP8xluaDvn7A0Re01M33yM3LT0YvYReLDnS+6bHLsrW92+vcn57ehTdbjl
 9LPn7JIEYclF3E5Vb20G7itLUIbFD3kEI3njHCRTVUGlZ47G5EuwYrVVmL3zv/c1E2Bu
 UkrTsABmj9PvaXZJ+eCg9ZKEQKmuaXgEglzF6cdsg027NNU1Mxl18EkpzSRJMo7R8j9z
 ADug==
X-Gm-Message-State: AOAM533cIcMDYpQq03G/XLhOEw2ma2FwzX3e0Zjmx23oTGCESl7hCAEm
 1ZFyVMYvax4Cz/1dmdnRbjsh7w==
X-Google-Smtp-Source: ABdhPJx66j3Z3S4vye5sgwXdj+nfn5Pw1dqJE3BCIxshfgN+WI4IsNFGybEL3NUhX6uz2b9yZrS6uw==
X-Received: by 2002:a17:90a:69e3:: with SMTP id
 s90mr1129884pjj.130.1601106003310; 
 Sat, 26 Sep 2020 00:40:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id c12sm4540274pfj.164.2020.09.26.00.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 00:40:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200926045048.16175-1-tanmay@codeaurora.org>
References: <20200926045048.16175-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Sat, 26 Sep 2020 00:40:01 -0700
Message-ID: <160110600102.310579.8458722739510072790@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: DisplayPort PHY compliance
 tests fixup
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, khsieh@codeaurora.org,
 robdclark@gmail.com, seanpaul@chromium.org,
 Tanmay Shah <tanmay@codeaurora.org>, daniel@ffwll.ch, aravindh@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-09-25 21:50:48)
> Bandwidth code was being used as test link rate. Fix this by converting
> bandwidth code to test link rate
> 
> Do not reset voltage and pre-emphasis level during IRQ HPD attention
> interrupt. Also fix pre-emphasis parsing during test link status process
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
