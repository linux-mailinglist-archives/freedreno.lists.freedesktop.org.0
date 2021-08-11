Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D33E970E
	for <lists+freedreno@lfdr.de>; Wed, 11 Aug 2021 19:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A310896ED;
	Wed, 11 Aug 2021 17:51:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FF28972B
 for <freedreno@lists.freedesktop.org>; Wed, 11 Aug 2021 17:51:40 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 n1-20020a9d1e810000b0290514da4485e4so1577956otn.4
 for <freedreno@lists.freedesktop.org>; Wed, 11 Aug 2021 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2DfNuz5O7Mpdzge58x7dhXEmqV1KbsWUVKw3z3NErkw=;
 b=KegjHwRhqP0eyTIjTxdo+VQWrHOjxNclssYbN0gYdv+UXtuPfpLohCE61Br2R0f0xS
 sVV35sxF3U+OMySclqVD79ydUWjUvGcKMnapmPU/O6z0A22kYnk00cKWLKFDpniF2zh7
 YgjtJ2yV4YWL/DTcfHaijEnuQsELdmlb8846E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2DfNuz5O7Mpdzge58x7dhXEmqV1KbsWUVKw3z3NErkw=;
 b=V0z0XxGFxB/HKxxlGTaxnLrRj0rLE6LERmp1+BH9CnBoUF0WeGfhyUpWwgaXraI7gK
 WegJypuQzy2jMckz9H5OVCmz4/NWjF/jwppPYpSPOi9Y15+uoAqUOnd2tp/X06cQyKn4
 D/8A+CRanoenm96xFEtGY+wa0kN21jO0MCN366S7QTc111J0xbPBtoxwj89EebxfxUEB
 wAaAUPiCyyGHgLDMArJZOzR85BlviuNU1qX/QwLNlAimNZ7p46RwPRuKN94ppqugtTbs
 qyEXjM5iUp26fpP3G8RQe+/8mo7Q4hPEqX4/WtMYwc/CtY2iw64lZ5Bjygi0OFx+O9z5
 68/Q==
X-Gm-Message-State: AOAM530V8UjSCOfwA2STDUqrHcIsZca2X4Hu+CAKZkoelDlTceI4czJx
 NGLY06l1pVen6pk+PoyjqIoQMBfT0U+9zd4KMinocQ==
X-Google-Smtp-Source: ABdhPJxP4Vj/nnRZByQ6ppiULeaZtVP0wwSMf/t1xhztsfuKaN7WpnJStix5REbZv/OdPm2wJyTwoly2glhXlLB7PX4=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr120971otq.233.1628704299752; 
 Wed, 11 Aug 2021 10:51:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 10:51:39 -0700
MIME-Version: 1.0
In-Reply-To: <1628691835-36958-1-git-send-email-akhilpo@codeaurora.org>
References: <1628691835-36958-1-git-send-email-akhilpo@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 10:51:39 -0700
Message-ID: <CAE-0n51i2OcQ5G=nDXyOQwYoT4j3iyRKu8r-YYotmqTNfaBzhQ@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
Cc: Jordan Crouse <jordan@cosmicpenguin.net>,
 Matthias Kaehlcke <mka@chromium.org>, 
 Jonathan Marek <jonathan@marek.ca>, Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/2] arm64: dts: qcom: sc7280: Add gpu
 support
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-08-11 07:23:54)
> Add the necessary dt nodes for gpu support in sc7280.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
