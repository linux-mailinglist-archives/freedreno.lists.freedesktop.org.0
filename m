Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6280D1A4985
	for <lists+freedreno@lfdr.de>; Fri, 10 Apr 2020 19:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9C36ED32;
	Fri, 10 Apr 2020 17:48:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5576ED2E
 for <freedreno@lists.freedesktop.org>; Fri, 10 Apr 2020 17:48:57 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id d63so1994280oig.6
 for <freedreno@lists.freedesktop.org>; Fri, 10 Apr 2020 10:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+zNuF3LiP7kvgVV1lvcUDcmbeJ3DBvPeuSAiKMFaGnc=;
 b=Bj2Hy0OC00lIU4y0np73kMzTKObrFq0RRTd+mFPP6eL7VqOtATnvryLyXao+CZhq3V
 q42tGgRcLrefnPwyTo9jVNkSLDYY0c4xh+s1lHjz42DqugicUH4htvlW0as+0yjOHZFk
 OtekRmEROLqpLa9+qBlUjVeOA8Xjj3fEaH54SEGK2QvLfKw338v5gKxUPDoHLDwWWxt8
 PGNRWIGYoQaHrlYSEcPzAhbdyXsi3al+8h/YVEw+UAltgk9nEEa44WvLAqNZddzRBdmQ
 8bB1vaq/GKbHONlZ7vEnvpN6h3u2OmrPAkEnQ7Cby6Fe1IHfm4M8Js0+L4AxSBYmB7X8
 /9Zw==
X-Gm-Message-State: AGi0PubvlxsX7arO9NoupB8xb1X+aJtK8IYTIHqQFMUJ8Dt0pQoJE01P
 p5jQ7fjsOrR402gX3nfejw==
X-Google-Smtp-Source: APiQypIt0cEpMExqzLdxjcdCSCFkFwJgM3Jj7xITc2xbl8Ot3NQLeW5lxcuMi7lDACDtIRWU3GO5eQ==
X-Received: by 2002:aca:3745:: with SMTP id e66mr3965165oia.153.1586540936614; 
 Fri, 10 Apr 2020 10:48:56 -0700 (PDT)
Received: from rob-hp-laptop (ip-173-126-55-226.ftwttx.spcsdns.net.
 [173.126.55.226])
 by smtp.gmail.com with ESMTPSA id u17sm1523713oiv.21.2020.04.10.10.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:48:56 -0700 (PDT)
Received: (nullmailer pid 28391 invoked by uid 1000);
 Fri, 10 Apr 2020 17:48:53 -0000
Date: Fri, 10 Apr 2020 11:48:53 -0600
From: Rob Herring <robh@kernel.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200410174853.GA28335@bogus>
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
 <1585641353-23229-6-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585641353-23229-6-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH 5/5] dt-bindings: drm/msm/gpu: Document OPP
 phandle list for the GPU
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
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org, mka@chromium.org,
 dri-devel@freedesktop.org, viresh.kumar@linaro.org,
 freedreno@lists.freedesktop.org, sibis@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 31 Mar 2020 13:25:53 +0530, Sharat Masetty wrote:
> Update the documentation for listing the multiple optional GPU and the
> DDR OPP tables to help enable DDR scaling.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.txt        | 63 +++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
