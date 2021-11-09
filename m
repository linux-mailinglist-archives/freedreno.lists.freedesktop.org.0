Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FDC44B52E
	for <lists+freedreno@lfdr.de>; Tue,  9 Nov 2021 23:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD72D6E88B;
	Tue,  9 Nov 2021 22:12:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CAF6E88B
 for <freedreno@lists.freedesktop.org>; Tue,  9 Nov 2021 22:12:20 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 p11-20020a9d4e0b000000b0055a5741bff7so908599otf.2
 for <freedreno@lists.freedesktop.org>; Tue, 09 Nov 2021 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=q4dY+M8nyiFAt4remZo3SHhwNRe5f+ykJVrEzZX13ZY=;
 b=dUVV+iZ7gYosXBMozkc7vKB1RNOH5oYuxH+4ETASHmsxotjE4SMaeLcPuNuZo3YgLS
 VKqrYcvpOjHVanfYHo2JDTh9TG9fBjUwC/5YUeev8lYij4oN6Dvhmr9g993TWSjfRQXA
 y/Ob41ctB8Ez3blzsLaMRml0A4mz13rP97ljM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=q4dY+M8nyiFAt4remZo3SHhwNRe5f+ykJVrEzZX13ZY=;
 b=KX8H8TPuZnxPT2VbtvAYBHvIcRdF5DdsHRfjn8wMEscAiLNu4TD6HCwlAOi/ZTgYFC
 dVHP0rn2OKDHLyI+gu7oAB3C1VCizKP1fOdsECyZAYh1ZwZZ7pVyaUNS4z9itLeo2DJb
 79jAJaqkSVwhdaGj6mmwdCRXnAj0TPVMYgaZ/akLbgYLYEv8ZFQv7AaoO5LUPUegtQ35
 nKRpFC74tRuzer9B3JH/qtd1YzOgFQqQQcpW/TpNeU/GF3XtbpD+OM2GJ+O5/SzMmU6N
 LTYBEAPi0CYYOba27MHjYOD/qUgnQ2RU3eUCyrPJIKieYLyMSzqOy1MMTq7KcdGa4986
 E1og==
X-Gm-Message-State: AOAM532aViYcbeeeFjZR0SoARPcQKYWGhhEJlAsO5UGykIuz40PCiuhU
 7e0NMN4pcN+7gjTgE59PwWZN6+fx575+Yy4vCRl7Ng==
X-Google-Smtp-Source: ABdhPJzCxZIvzxfRWv/IW1ZG0J6NJo3QJ4ZuZGIuMdYHfvlxdSbDBBsE6NHiPmYbpRrVGi/S+/NGsMIcLCSrzc29ITI=
X-Received: by 2002:a9d:2f42:: with SMTP id h60mr8342701otb.159.1636495940269; 
 Tue, 09 Nov 2021 14:12:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Nov 2021 22:12:19 +0000
MIME-Version: 1.0
In-Reply-To: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
References: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 9 Nov 2021 22:12:19 +0000
Message-ID: <CAE-0n50a5LWpi1JoY=BpwPokpuzYC2c3RXv86Ob_azmdCOkgyw@mail.gmail.com>
To: Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm: use compatible lists to find
 mdp node
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
Cc: quic_kalyant@quicinc.com, robdclark@gmail.com,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-11-09 01:47:28)
> In the current implementation, substring comparison
> using device node name is used to find mdp node
> during driver probe. Use compatible string list instead
> of node name to get mdp node from the parent mdss node.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Use compatible lists instead of duplicate string
>     check (Stephen Boyd)
>
> Changes in v3:
>   - Use match tables to find the mdp node (Stephen Boyd)
> ---

With the export symbol dropped

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
