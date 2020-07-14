Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214221E4F9
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 03:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A8F6E85D;
	Tue, 14 Jul 2020 01:12:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28496E85D
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jul 2020 01:12:21 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id a14so6844676pfi.2
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 18:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5yjaTy96iRFPTsi26P18yq64D5S2151Zztu56aP2UQk=;
 b=DKREwuM1AdDK/M5PRjMceNQQ5PSr4Xfy3P/tz5j9KLqG7xpQvwFBtF6iqOKNiHJeHz
 0LtGhspN0cAeU/1/I6hlmRFzPP+PakMNDDWkk+6neyLAw6VjOq3PKxLlGjVYFwnl71jY
 CvuZix9jHtiIZKtZpVPiMHxs6yo596oGk6UAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5yjaTy96iRFPTsi26P18yq64D5S2151Zztu56aP2UQk=;
 b=uRMnIqv6J0ovHDsTFc0AWOcygV6w8ueGtGWNkNEVboSg/vu86DG4RMzWIeJKY3seL3
 +n102ig1BNl2l0qzG4bTDzNHU9OmbCPOW9aMJbGEJowFgFUxFGAckQeB+yOR9xXBZ3uV
 nBaoMi8utMiVRc6MI3VakY8Mum+dZ6P/4gehwaIZPmpkFeRrRzgK08v9GoEtdE3I7O0A
 gF3Y/ERSa4ob0OaFyGRgdjzujEzoYVzBXPYTFtX/75VqRbDqKhvdskZaR7CX1Boz+u7c
 uvWsiqhZ2Nj0J2iHbOXDhBWBxQfCOeRinlhpUHcVbtzSMcRvLbeIRohHISOfbzCTrW68
 vUkQ==
X-Gm-Message-State: AOAM533KvsaqnIq4jStYN/qxKuAKQMjYc6F9wScK8Lathpupriz756CS
 L6gbhPtAOyWyWLKj1VWeHWqAqA==
X-Google-Smtp-Source: ABdhPJzURU5w7Tj+O39sbKidAAXjNVHx+XXYlAgKEyC4g8eI7DWw01L8nI4SKvyRTPsf2//G04xEaQ==
X-Received: by 2002:a05:6a00:14ce:: with SMTP id
 w14mr2275557pfu.121.1594689141507; 
 Mon, 13 Jul 2020 18:12:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
 by smtp.gmail.com with ESMTPSA id e8sm15972489pfl.125.2020.07.13.18.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 18:12:20 -0700 (PDT)
Date: Mon, 13 Jul 2020 18:12:19 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Message-ID: <20200714011219.GQ3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: add support for clk and bw
 scaling for display
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
Cc: devicetree@vger.kernel.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, travitej@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, hoegsberg@chromium.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
> This change adds support to scale src clk and bandwidth as
> per composition requirements.
> 
> Interconnect registration for bw has been moved to mdp
> device node from mdss to facilitate the scaling.
> 
> Changes in v1:
>  - Address armv7 compilation issues with the patch (Rob)
> 
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

It seems this is an evolution of this series: https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351

Are the DT bits of the series still valid? If so please include them in the
series, otherwise please add DT patches to allow folks to test and review,
and get them landed in Bjorn's tree after the driver changes have landed.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
