Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1A731EEA6
	for <lists+freedreno@lfdr.de>; Thu, 18 Feb 2021 19:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7967D89F41;
	Thu, 18 Feb 2021 18:47:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCDE89FAC
 for <freedreno@lists.freedesktop.org>; Thu, 18 Feb 2021 18:47:13 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id c19so1876471pjq.3
 for <freedreno@lists.freedesktop.org>; Thu, 18 Feb 2021 10:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=hwGMhFSpUZ+8IXq8QZ1Gz3vsECNheP1SgnkaWXhUlaI=;
 b=Kg+PGRM3gO7wDPL6kZftJKUY6fnhghWTbGzTjonou2e29fwKEEp4tLMknMlps5QGVK
 Ayl7L0eGjQ+wvpr+dILJrNVED75qRl3QnWmwdg9FB1ZOGJDMejCfWHwrxnNip6AxOZxg
 6WqLPlXDR2vCxTVPYkOpgpxL4OgTM/Cm55CTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=hwGMhFSpUZ+8IXq8QZ1Gz3vsECNheP1SgnkaWXhUlaI=;
 b=bKZwkTGdwkLXJxvE8gU2T04k4bsIAhrCcYSOsDuEu/g1mTrUx8I2tTLi232LX3WYE0
 LcntwV46baIIIQN9zbpu3jFChGn0IGL0pUYtLNIcZpFg7ELylYNw8Wd3ZYGTG5/u4jOp
 oZ6poMEWt5d7NVUIaTf+Its3ZOqXXCx5SAUseBMoOrwWWHudhuIGbgwChpt5Q0ScLok3
 BeGEEhRov2bcwe5Sn4+hgAD++xditOMZuAGzCczo7y/rfn1NJokeXIFGxXF1IAvm06p7
 ZY3qYTyomUGeUMt/wvTVuGsoIzXYjzE2EBnF64VMon5aZbJ11QOaUk7WlqTsNTycyXH4
 46hQ==
X-Gm-Message-State: AOAM5333Ug0BfZ38NG4KCrrTW2MTIqGQWEaqD9Wm522Z2sjuDb3Zt5rn
 9CPrNUW4/8RSb5zWhcf0AGLQHw==
X-Google-Smtp-Source: ABdhPJzXASW7UW1qP+wySWhkiDv0DfzSYH/2XlmgQazxzKYmSoEl0w/SmWQge0xYnKEw7PYvWKuZVg==
X-Received: by 2002:a17:90a:b292:: with SMTP id
 c18mr5216701pjr.134.1613674032774; 
 Thu, 18 Feb 2021 10:47:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
 by smtp.gmail.com with ESMTPSA id 8sm6379722pjl.55.2021.02.18.10.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 10:47:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
References: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Thu, 18 Feb 2021 10:47:11 -0800
Message-ID: <161367403102.1254594.2276430831177324166@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dp: Drop limit link rate at HBR2
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-02-17 15:09:57)
> Drop limit link rate at HBR2 to support link rate
> upto HBR3.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Should also say

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
