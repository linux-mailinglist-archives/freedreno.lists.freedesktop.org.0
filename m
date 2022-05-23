Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E261C531EBC
	for <lists+freedreno@lfdr.de>; Tue, 24 May 2022 00:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBE810E3CD;
	Mon, 23 May 2022 22:45:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB9210E86C
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 22:45:01 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id e20so13125913qvr.6
 for <freedreno@lists.freedesktop.org>; Mon, 23 May 2022 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rypfduMofq52o9Cw4bRVJ4YmnkHY5oYB2ohQA+ESkAI=;
 b=k21oHGm0XlDpBA85Iv8KLMxGl747dSSdXE/EQyrLw9mufTBWj0M6QTD5xziStZGSax
 rsRSKgHWBLMlhZ92G8QYix9zssd7roGkDcKcOVZ78tx2ubdiDauy3Vbkx008q6bxygJ4
 DUmQ26ZXi3O2lWLDlZDoUFt85gOIQ6f1dlS2AhQ9k28X+yfGX3ow6kOvQNJgZHpnnzvF
 FWbQfK8KuSu9LWM1QZyd6uCIrhja4Y/y3XPc/g+P4FxJwERhcMptBoMl3Xb/l+rYfkJh
 8rebEvtWe+YSg431tnavm1SWe+NxnNWr/h9TNjHOIcf+Fj+ppVEv6ttuw9iIYwaoBIu5
 4SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rypfduMofq52o9Cw4bRVJ4YmnkHY5oYB2ohQA+ESkAI=;
 b=5jezEtw70q30x/N+QOedaei4UmXbEk3CMH7JEJYvorD4CDthlYCWSA4c/RGyynWgny
 nW3Ypr7KJncwHrWxlQaJrl7OB0N0wsH+nY82dUon3veKLlHCC6blaROLZDj0/n5ll/tV
 uReLDDPwdjUpKRJsLRh06n4t8fjjWzkWwZaVATPo1Rm4YHUqo30Sl9lmHwWA85VBa1MW
 4ZCeb+M3ifhY/kaSV1KBtjsceAN2vRI8tD7/FCx5oWhAvtZrITpexJ4xLFPXMgN7jxpf
 SxfDw88wWhVL0tghTCPVftDvoisHldy/CsEAD2gXyGdchTMhADDBuqp1ZOGPBMwQMwYK
 dBhA==
X-Gm-Message-State: AOAM532cDggJAGXWgOqNaGA+tMSJk5Yd2xw7UHyWvHh48/c94GASOBUL
 OUPgNzKhKUG3+Eel6BzoK/ZGQhArv9vHHWF5qyK38Q==
X-Google-Smtp-Source: ABdhPJzz71U22o77PPLCWll4LOjtW5ov17NvyPyylFN9GoUFs7JpXdQIQhFptHaspJJWWce0ytJssabLtNao3p4Y8No=
X-Received: by 2002:a05:6214:3e1:b0:461:f0b1:6b12 with SMTP id
 cf1-20020a05621403e100b00461f0b16b12mr18964358qvb.122.1653345900868; Mon, 23
 May 2022 15:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-6-marijn.suijten@somainline.org>
 <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
In-Reply-To: <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 May 2022 01:44:49 +0300
Message-ID: <CAA8EJpqB4wAZo_EVX9dgTvAyX7yqTUUPNeEUsG58nckdDKxr-A@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 5/9] drm/msm/dsi_phy_28nm_8960: Replace
 parent names with clk_hw pointers
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 24 May 2022 at 01:44, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 24 May 2022 at 00:38, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > parent_hw pointers are easier to manage and cheaper to use than
> > repeatedly formatting the parent name and subsequently leaving the clk
> > framework to perform lookups based on that name.
>
> Can you please add a followup patch (or a preface one) removing the
> rest of devm_kzalloc()'ed clock names.

Argh, stupid me, you did that in the next patch. Please ignore this.

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
