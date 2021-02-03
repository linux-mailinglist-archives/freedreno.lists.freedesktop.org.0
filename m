Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31830E7A7
	for <lists+freedreno@lfdr.de>; Thu,  4 Feb 2021 00:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D316EC42;
	Wed,  3 Feb 2021 23:42:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD3E6EC42
 for <freedreno@lists.freedesktop.org>; Wed,  3 Feb 2021 23:42:37 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id n10so834511pgl.10
 for <freedreno@lists.freedesktop.org>; Wed, 03 Feb 2021 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=yHURpLyu/TquLwx0y6eDJwaaKqJ+uw0cFvyf4JRgnoA=;
 b=Xbu8iTy1ZRPuaYXRVmxobKDV5EKGQvnequV/L0RekgYt4FzgK9lp0xnGDN73+uQyoI
 ytcu36a54c33UIBrX2kuE3aKpL+gwWCeMAsiadVMATEvvyhykfzqXLIj75BPw6+eCBgM
 +vD8KVcdswPshqB4gWnt5M3kUDKl0LXXsgLx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=yHURpLyu/TquLwx0y6eDJwaaKqJ+uw0cFvyf4JRgnoA=;
 b=c14LXin/WuP+FjNe5odxetyHgCPuco051FXks41dSiDEzDvqBcuY5BbbT2epyqSk6+
 IejVDqoEOTcITPD+bPs78YizooF7T7fWbxHPJW20m9wV4xgHr6yGtHcI0iS5w+juB0uT
 u+snETaOW/xRNKRBqgXflJR29ANNTyTkE7i7IcCqzv5VurJ7WXCRLUVQdiIF5W2lmnIJ
 heRQgv9KCjS2sMWfTCQVR7zIg3oteKjaebS3iXvu47hbibd+kZ998F+0xrMeLUwJQY2N
 nENa56FVFLbCwV6+qeuubCHchPv1CkI0c4B2PZxe65skaSc9pZBEkfXXL8+HAbZ7LOHh
 ZGIA==
X-Gm-Message-State: AOAM533xn19df43mwIwAoBWCN93kVHrXEeRa8m9T7lM6MZtHQ0gpHyXt
 RWgLLeM93CQxCmZT3kaoJyN/BQ==
X-Google-Smtp-Source: ABdhPJwhsJh7E/fIDVP54k0kiykGJypLBRTzhIYCPpD8yyPHqosMKVlqghMEgmQEviD79/BVAuLORQ==
X-Received: by 2002:a63:454e:: with SMTP id u14mr5968407pgk.113.1612395757069; 
 Wed, 03 Feb 2021 15:42:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:59f3:e03b:c082:48d])
 by smtp.gmail.com with ESMTPSA id r189sm4026820pgr.10.2021.02.03.15.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 15:42:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210129094416.53601-1-vulab@iscas.ac.cn>
References: <20210129094416.53601-1-vulab@iscas.ac.cn>
From: Stephen Boyd <swboyd@chromium.org>
To: Xu Wang <vulab@iscas.ac.cn>, airlied@linux.ie, chandanu@codeaurora.org,
 daniel@ffwll.ch, khsieh@codeaurora.org, lee.jones@linaro.org,
 robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org
Date: Wed, 03 Feb 2021 15:42:34 -0800
Message-ID: <161239575441.76967.11776777354164899550@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp/dp_ctrl: Remove unneeded
 semicolon
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Xu Wang (2021-01-29 01:44:16)
> fix semicolon.cocci warnings:
> drivers/gpu/drm/msm/dp/dp_ctrl.c:1161:2-3: Unneeded semicolon
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
