Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1724DCFEE
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 22:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3F10E7D1;
	Thu, 17 Mar 2022 21:11:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349F810E79C
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 21:11:02 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id j83so6957048oih.6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RDGPwozN+LQmHwPOGm8zL9xPqdfxPVJfVvPr3LEIR84=;
 b=ohgOnRsTHNsHzn4tKFhXj0CqnCXzox1Cdt3qCVI5G7pxE2w8oUcWQ2XY+g/7HDIjum
 5kLmEu5WFc/STfCzRxgNoLeCM5fs8exy+hvMzzZxkCDirnRZEWaJ2HcVw0qdMaWXJrE8
 T84XuIWK1JMGyXIM+hMKfwXOo1gTIVpL/BQ6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RDGPwozN+LQmHwPOGm8zL9xPqdfxPVJfVvPr3LEIR84=;
 b=i7SPXiSzgf1azpSBhqdezm4xPZ5n/Uzo9W+QzPr5CMMJCuOTz8try+4R7AZJC+t//2
 HbgA1VZE5f3uPF+qd0l9BnlHN0htHDjl4HxoojQyuvlOBhvSB5koAxFyrXueFR1wGHnS
 oA4uZcuovFSZJTUOXZ6RGSelu0tEwbXjGGaZ62lCWBgWdmh3wEw5wwX399s3bMtaubv6
 AUTSXv+vXXV6SQyIYfshj17+8y1iipjwX9sdPKGUCp/h3bgdA3yZh/Ry9Spg/tLn2FBD
 Pyp4VmSOrC4Ywuq2OSUKDnp+UZ7xbzsXPB0BkOl9Lr4rgnU4jqxGU1rmQVZdql+9gaPg
 +v7A==
X-Gm-Message-State: AOAM530GAC3oidL68XEDmoagUo/ou4TKaRkj4wrq8UujNrj9ou1CoiG5
 Ao6OPlmDmoawSoudbF+HwnfGtQMSVzvdy7QkR/L2Pvs/iZo=
X-Google-Smtp-Source: ABdhPJwxqH7a3bQvRdSLIQBod5CkCbz7k99FXmolKOyZUVcv+RbpXkv78qjENrJA6MeD+xN0XeA0bpgBgINxE6TF4Ng=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr3000622oif.63.1647551461460; Thu, 17
 Mar 2022 14:11:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:11:00 -0400
MIME-Version: 1.0
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:11:00 -0400
Message-ID: <CAE-0n51vfoOK_6B0yAvws32MtLQ1SvBPoQPHBFE14TLzZFUZaw@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to
 the maximum frequency in opp table during probe
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
Cc: dmitry.baryshkov@linaro.org, quic_kalyant@quicinc.com, robdclark@gmail.com,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-03-14 07:46:53)
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.

Capitalize 'use'.

Why is it important to use max frequency during probe/bind? Does not
setting the clk rate during probe mean that we'll never use the max
rate? Does it speed things up during probe?
