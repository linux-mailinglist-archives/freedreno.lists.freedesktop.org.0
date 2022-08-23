Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE459CED8
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 04:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB41113E56;
	Tue, 23 Aug 2022 02:57:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80F010EA57
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 02:56:52 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 a14-20020a0568300b8e00b0061c4e3eb52aso9001875otv.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=pRP+8U5uk2FhrsR7FeF6rksjBRXFOZLP1bxG00VCGkM=;
 b=S1yE7/nR/xhnTOsCb6R09FAIiBcW9VLJt8RZ3aON13tDzQniu8n+fXwuYs7JvwdPYt
 RLoojZsaGPVMrtHXNQmeGkX2R+UnGtBkJDbttvGB5aj9/3xd3xShrXMrYipQ0UOLndl4
 HmiO/B+HQvfqvr4XJc7pVg13G5rpyAjBCdJGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=pRP+8U5uk2FhrsR7FeF6rksjBRXFOZLP1bxG00VCGkM=;
 b=7HSl/azH/X0yKAms8yEh4iExRqKBrnAx1HDvOUtQ9PQeDBcvgP/g/qC5T0zjJRmS7+
 G1eqobM6dOm57E06h3hFYa+q0jzmN8/SIlieqjtXAfAnOqLhlH+eiZ41z+74nRgrRkZY
 SlIUfqowDCaHv5Zk97DbtCrCwIw6lKfZ/nCmzE4UVe94Bubf3NJbMDWVicczb1flPAOF
 jE0MOlKmJ2GqRj8J/OigzVYYzTqE4jZfkfw2YZ1EybyYxPSOzM0P3vya62mujwRk8+tr
 NvZlc3KmI+qWfRWffMTp79n/gBlB8ex1VVriR73IV4vMrrZy/pMTOZmbmuJ4I7NDYwHn
 DNZQ==
X-Gm-Message-State: ACgBeo3r6xdIHvrXiopHeRynwuopMfyfVYohrkDrhvo7wqbXx6U9lYhm
 GY6UFw5d5wey7HKyvB1YpXHYYn0r6rimgvgP4vO1jA==
X-Google-Smtp-Source: AA6agR750VjH+sLACBIdPvl7p7EMj4bzSIHj6n6+A+g0qZB4hZGSar3BcfSf3XzBZAYBm5qPDenRMmSBgr862x3rDUw=
X-Received: by 2002:a9d:53cb:0:b0:637:1ddc:615c with SMTP id
 i11-20020a9d53cb000000b006371ddc615cmr9123790oth.3.1661223411932; Mon, 22 Aug
 2022 19:56:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:56:51 -0500
MIME-Version: 1.0
In-Reply-To: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
References: <20220822172455.282923-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:56:51 -0500
Message-ID: <CAE-0n51ajuJAsTXUmgcve-3TA37sOq1j_2WawweZYxo3L0R-9A@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: drop unused memory allocation
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 10:24:55)
> Drop the dpu_cfg variable and corresponding kzalloc, which became unused
> after changing hw catalog to static configuration.
>
> Fixes: de7d480f5e8c ("drm/msm/dpu: make dpu hardware catalog static const")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
