Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AC30C981
	for <lists+freedreno@lfdr.de>; Tue,  2 Feb 2021 19:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F347689C82;
	Tue,  2 Feb 2021 18:22:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA3789C82
 for <freedreno@lists.freedesktop.org>; Tue,  2 Feb 2021 18:22:02 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id o7so15449452pgl.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Feb 2021 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=H3Ktduf2QxtISjs8SRv/RgHUJLdczDldyTBeCd9r9t0=;
 b=JZKF6L+xZ0ixNqQkugWKwkTH8BX4f7XZ4EnCXuycwHUkO/STif4yShPRGkSWv3WnE+
 TwlGVsIE8o5elNHxDk0dHruDHycMm1uiXsGRWUc0OFaLyRiAts55Zaz1i15DK9kVzLlu
 lHiC7/zQ3USfSRYNLs3uhIfeK5ibwcw69YygY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=H3Ktduf2QxtISjs8SRv/RgHUJLdczDldyTBeCd9r9t0=;
 b=lbIa0C3Thxz+FL6v8QWvFyvM6FRaRXFD8IMyvOvX0s2PFzSbzNu0LYEylU67sECf6t
 AfCLqOEF9OFyRSY4nDbmF6nuEcsYNd6eaIdbKiqqZZvLC76TEVMGTBypRPggtJqutKmi
 fdf76nSwHDW3IaMyza6vLstNGwR4/wNmutcv/oma7DQ5B15PFnf5j64mettMCCYE37k8
 7hyCOvZh448LY69wqpm269HkNGIT5ZVi0bCmt6FWlH+j8QiI8jkkehApF0C1fK6/HQ1v
 piz+8kRVwk9cVg4q8K1BLYVJ8YSUvgdpYfkLJeG5mtf0skKuMalA218uPaiMC0SHqjWz
 5Pyw==
X-Gm-Message-State: AOAM531O8SdgyGXVsfJZ93grU6AvDcR1HYBN5Heje5pDt7yBXom9pZpH
 31mP75IdS984ufXp58ziK0bL8Q==
X-Google-Smtp-Source: ABdhPJzmldyf2y2Wk1vWOl94CphO+LqXsIC7rCCdsLOlh0sJJeqoonhUJhmjgpgtFexAJ0nzN/uNuw==
X-Received: by 2002:a65:4101:: with SMTP id w1mr11472979pgp.323.1612290121838; 
 Tue, 02 Feb 2021 10:22:01 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3571:bd6e:ee19:b59f])
 by smtp.gmail.com with ESMTPSA id q2sm20238115pfj.32.2021.02.02.10.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 10:22:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210202123214.15787-1-bernard@vivo.com>
References: <20210202123214.15787-1-bernard@vivo.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 02 Feb 2021 10:21:59 -0800
Message-ID: <161229011920.76967.17860389589804358045@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unneeded variable: "rc"
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bernard Zhao (2021-02-02 04:32:03)
> remove unneeded variable: "rc".
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
