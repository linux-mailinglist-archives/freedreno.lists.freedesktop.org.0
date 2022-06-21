Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC99552B10
	for <lists+freedreno@lfdr.de>; Tue, 21 Jun 2022 08:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32B610F794;
	Tue, 21 Jun 2022 06:37:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5067610F7A9
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 06:37:58 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id q4so6911205qvq.8
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 23:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P/ZHdlDT/z0JI9+6gk/VhCpD+I3j8EEmsNtdy7Bk49Y=;
 b=no69+S00OHtDn40C4P/ra6GtR2wAm+qZUvTHZI8jEsM7uozh3LIqJgHR6kVRnWoKij
 HhYRSmz/G5z1mA+Kjt9FNiJcqYNTEvbTEkRDTJE7JtvW4lkAMDyGjTfVJuM2UgNeMXJl
 gePm1zHlxL/iFGGe8Os0UpF4giF7MlwaoSf8cr3KSA1Qcx0CN0fYl+bvVQz47ZOu/tK2
 R6jd11qjpSMC90G8aXCxN26qHzzJE5S7JTra7sG7a/1N+FfGbn9O8a0Awa9p9QzPDFTE
 lyouT7/Kl2thQ9ZUkf/mIQ1DbMNmYlJfg0HXEP2wEPfy+uekoBE3ry59aIvICACUGrBc
 aStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P/ZHdlDT/z0JI9+6gk/VhCpD+I3j8EEmsNtdy7Bk49Y=;
 b=i4MZpTCWl8X8KYf0kIVU3DxXShGJDEYlfT5XEI9r2KijHUcGuvCTdiReCsPTvKf//J
 oljYVL7UdvAYKGpuWVS2S99Ah5c0K8tAXBtud0Poj8DMykTO0BRE+gpDqRAHXnW5mhRF
 y8HMEuG7tuPMrJsFegA951VRjPujydP3VpYIL7W7yDz061Xld/FhrzgLcTfVVEL4UCSq
 gWYALrc6q6dHihKc5F7cMRLLJGX26n5pkY8lmgvpj3kMujLoyNs27HGG9pKhVUTQI3ze
 j1dAxwcjTbK7pDmwpLmgIKVecNDToaeN8cTb+rDEShW6p2Tm+yzMVc6/ON9mLrBcmH6J
 v4zQ==
X-Gm-Message-State: AJIora9GjJbObqQvEGJ0VHG1SJFNKmemv3Y1/DoVb8iiEDNYmqyc+dak
 eHFb4dAFuq4K203017Xk2P1gxWfmNtBE6T4t44XHYA==
X-Google-Smtp-Source: AGRyM1urfcxXJusoqWuxDZVZribTjRxKDV1QpCSj5lZ2mCOm7wDgdqhAecge8mYsCHku6y64EqEoRchNmz8hELQtKMI=
X-Received: by 2002:a05:6214:d8d:b0:464:51cc:a552 with SMTP id
 e13-20020a0562140d8d00b0046451cca552mr21693032qve.122.1655793477402; Mon, 20
 Jun 2022 23:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220621005033.274-1-quic_jesszhan@quicinc.com>
 <20220621005033.274-3-quic_jesszhan@quicinc.com>
In-Reply-To: <20220621005033.274-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jun 2022 09:37:46 +0300
Message-ID: <CAA8EJpowsVp5nOqbo2thDp9ojaTJhh8OHnL6Ot-C6ovzckGJrQ@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/4] drm/msm/dpu: Move MISR methods to
 dpu_hw_util
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 at 03:50, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Move layer mixer specific MISR methods to generalized helper methods.
> This will make it easier to add CRC support for other blocks in the
> future.
>
> Changes since V2:
> - Reordered parameters so that offsets are after hw_blk_reg_map
> - Fixed mismatched whitespace in bitmask definitions
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
