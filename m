Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EEE1CFF2D
	for <lists+freedreno@lfdr.de>; Tue, 12 May 2020 22:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6076E97A;
	Tue, 12 May 2020 20:26:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3CE6E97B
 for <freedreno@lists.freedesktop.org>; Tue, 12 May 2020 20:26:47 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d184so6937103pfd.4
 for <freedreno@lists.freedesktop.org>; Tue, 12 May 2020 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=H1+2swSK0ijtdladJlvxa7bbEzZPqsR62nbBx9yOv3g=;
 b=JE/V+wE1UITbWdIxoFhww9gWKZXunG95YOlUyT/vk3cKWXiI7WS4hSgNdGFYXXeWq4
 qbOqyh6cY6JFc4Ex7PSmIGIeMoXilx3K1YD1zTSnxGNYkBKxlRfntW38VgCWgbQcsm+k
 b/iBEbYxUFXZLSqtef+YbXCHzwcFceN52RCCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=H1+2swSK0ijtdladJlvxa7bbEzZPqsR62nbBx9yOv3g=;
 b=a3rKzquVr3LVWP/LSwRT89zkYDHx3+Nh2Q6XcW6nqoYTvRyf6IXitY2gz/X6Pm8gNf
 ME4rP/iHkcpr8HaDi5rfaxnkOdlDE6CveO+kCWxK02xDjpwIY2u//lp1sEQizCJkPE5X
 Ovfgc/jSbfOed83YO00Vs7/9cab84m84vwGy/SEc1j1H1rzHjxcu7qZKkUcrQTe2JB3Y
 JK7EU1TJ2ipLZFSDT4Ets/4tj/C7zGAAzH5LhyYQ0cOm0STyXAF2KO/K7yoIM33qXTfR
 hYoxAibyo6nGLXr+eNHSBnp5/vqhWuWQ4KyRmynA2/ZDFos51IGym3vvmt+htDX3w16e
 MuuA==
X-Gm-Message-State: AGi0PuZQpSF1HktaEdMPQneqkCjz3I1Zm8v1jdYU+VOwMXpcN/6T4QTD
 Su9aoOVn043eah3d5SyckbxBEw==
X-Google-Smtp-Source: APiQypLe8sd80AjBjKfNOmw9eKS5QoYDfT462qPcJ4ychbs6jqUvUTNFyPQJKYLB8FBDLFHSBXQeyQ==
X-Received: by 2002:a63:4f0f:: with SMTP id d15mr20990453pgb.339.1589315207257; 
 Tue, 12 May 2020 13:26:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id w69sm12692970pff.168.2020.05.12.13.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 13:26:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200422090443.12529-1-harigovi@codeaurora.org>
References: <20200422090443.12529-1-harigovi@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Tue, 12 May 2020 13:26:45 -0700
Message-ID: <158931520588.215346.14524550377627605126@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [v1] drm/bridge: ensure bridge suspend happens
 during PM sleep
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
Cc: dianders@chromium.org, Harigovindan P <harigovi@codeaurora.org>,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The subject is not specific enough. I'd expect it to be something like:

drm/bridge: ti-sn65dsi86: ensure bridge suspend happens during PM sleep

Quoting Harigovindan P (2020-04-22 02:04:43)
> ti-sn65dsi86 bridge is enumerated as a runtime device.
> 
> Adding sleep ops to force runtime_suspend when PM suspend is
> requested on the device.
> 
> This change needs to be taken along with the series:
> https://patchwork.kernel.org/patch/11494309/

Why? It doesn't seem like it should be required to go along with a qcom
specific driver patch.

> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---

Besides the subject:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
