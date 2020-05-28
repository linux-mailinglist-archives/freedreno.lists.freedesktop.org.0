Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39681E65A7
	for <lists+freedreno@lfdr.de>; Thu, 28 May 2020 17:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696596E155;
	Thu, 28 May 2020 15:14:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C030F6E155
 for <freedreno@lists.freedesktop.org>; Thu, 28 May 2020 15:14:52 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r2so483449ila.4
 for <freedreno@lists.freedesktop.org>; Thu, 28 May 2020 08:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yIDw/uV1HgHlRds6XnPkvv3A35C2qOGXIu1RjiUeb9Y=;
 b=NPIZ9yicCok1kDw4sPcBBTmJhSbuHMSq6bZuTG8L17AFlsBCBiEJ+7jtO6ts/MN4pR
 KlpFpAHqpHbmyy/fKcvOqx37nXyxZHdo5b0/O1smK4pMAphYF1k8EWdSd0SffkGvaMpL
 bsUDdOnR0T6nlPXoKBfQk2bmmCkxKVyywx9Kvf89E70TIWzF/3Y0GR1VSWjC2D2G4hEm
 Ih8SiHdZRyffhP3Vsa5C2yDgeafYqb/ktofY9qxd1wW7DocyuqoGXO02wpkp+K8345ao
 mRpWzgfufrjCb2ZScXPk2L+THU88A3AAgGLuYUO4pFOdqRqRKuXMWICH5UGZ4AZCwAOd
 tl1g==
X-Gm-Message-State: AOAM531jTxcORA607a/ni1UhlWni1B4TVbPHIpeqCJCOi4U3WYKbKP5l
 GbF5uHUNkIImOH5CTje2BQ==
X-Google-Smtp-Source: ABdhPJxAz1lpeRppgpo6BunFloCZvsPY8jFkCiVKE8KLqTvD/f0TRuU3AhQ7Ssf3Kpzq9YR+oZzPRQ==
X-Received: by 2002:a92:d151:: with SMTP id t17mr3335382ilg.101.1590678892145; 
 Thu, 28 May 2020 08:14:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i13sm3442788ill.65.2020.05.28.08.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 08:14:51 -0700 (PDT)
Received: (nullmailer pid 82662 invoked by uid 1000);
 Thu, 28 May 2020 15:14:50 -0000
Date: Thu, 28 May 2020 09:14:50 -0600
From: Rob Herring <robh@kernel.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200528151450.GA82632@bogus>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-7-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-7-git-send-email-smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 6/6] dt-bindings: drm/msm/gpu: Document gpu
 opp table
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
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 16:24:19 +0530, Sharat Masetty wrote:
> Update documentation to list the gpu opp table bindings including the
> newly added "opp-peak-kBps" needed for GPU-DDR bandwidth scaling.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.txt        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
