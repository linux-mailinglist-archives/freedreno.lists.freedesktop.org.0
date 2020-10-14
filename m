Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D111A28D78E
	for <lists+freedreno@lfdr.de>; Wed, 14 Oct 2020 02:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E116E027;
	Wed, 14 Oct 2020 00:36:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A9C6E156
 for <freedreno@lists.freedesktop.org>; Wed, 14 Oct 2020 00:36:55 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id a17so495187pju.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Oct 2020 17:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=9imkWvMot1MzH+ehLJwgyaxPJxuOFrOphid59RBNFTo=;
 b=HmED74OGfPJeiSnehPVeZnQq0lW4FvMWAIKlf6FYb2rHCFz01nDI709PwTOJWBOj/0
 MqXvSM8QPTAfDM0pB4JgvphWDxwGWuejZM0o8302Eeidj20nyPmXqdAJwiviFChpfl/v
 s9g+sRDQ98tTWvQF3cB4/9eQhNX2CD4UTJsuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=9imkWvMot1MzH+ehLJwgyaxPJxuOFrOphid59RBNFTo=;
 b=oL6U1J2UZ1KjUGI91hCJFuK87n2mX+wPKjKbDyDeUiUdCFQma1vArn5302Gx3qoCR8
 QCLnuNOaHsCeIH7TIG02n2VNZap9MT8NgywZ2SqvBL8xWuM0QFsRGA74ZIGY5ZGNWM1v
 VYbgEp3edaG26Fgqa7yhCpV7RbpC5JqsyTfZsO8TUBSOVFvNB3X+QkQ51aDHTjs40XmD
 jow/2PWyfjef3q/sximN2ExL53PBBpQG9C0ZD4GNnF3IEeaBpEhfObMN4CPqphu5tz6B
 +x/fIRrYcK7dY0D8Hn0CE4XaVMt1roFnIZCP6jRhziu17DscfdLwojoqo1R80QpUAEmZ
 jLNw==
X-Gm-Message-State: AOAM531gWbI2RByAzio5LV8LbDA/wfoKi8Gr9hBzUIJeN+arPrVINKCu
 W3UIsQYdra6UuhXmZX0ykDFOLg==
X-Google-Smtp-Source: ABdhPJz//cpuLR3q6+8Xtvz7MFQA92okbEa8Sfnd9VzfzsJ3RYQ0rokXMZ0mF0DjfGRDqJuhhbjOPA==
X-Received: by 2002:a17:902:708a:b029:d4:cf7c:6c59 with SMTP id
 z10-20020a170902708ab02900d4cf7c6c59mr2262370plk.52.1602635814708; 
 Tue, 13 Oct 2020 17:36:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id w10sm455476pjy.13.2020.10.13.17.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 17:36:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201013233522.5222-1-khsieh@codeaurora.org>
References: <20201013233522.5222-1-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 13 Oct 2020 17:36:52 -0700
Message-ID: <160263581242.310579.522359444728182805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: return correct connection
 status after suspend
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

Quoting Kuogee Hsieh (2020-10-13 16:35:22)
> During suspend, dp host controller and hpd block are disabled due to
> both ahb and aux clock are disabled. Therefore hpd plug/unplug interrupts
> will not be generated. At dp_pm_resume(), reinitialize both dp host
> controller and hpd block so that hpd plug/unplug interrupts will be
> generated and handled by driver so that hpd connection state is updated
> correctly. This patch will fix link training flaky issues.
> 
> Changes in v2:
> -- use container_of to cast correct dp_display_private pointer
>    at both dp_pm_suspend() and dp_pm_resume().
> 
> Changes in v3:
> -- replace hpd_state atomic_t  with u32
> 
> Changes in v4
> -- call dp_display_host_deinit() at dp_pm_suspend()
> -- call dp_display_host_init() at msm_dp_display_enable()
> -- fix phy->init_count unbalance which causes link training failed
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Can we add some sort of Fixes tag? Maybe the beginning of this DP driver
support?

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
