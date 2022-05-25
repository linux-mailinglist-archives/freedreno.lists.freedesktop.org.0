Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BACA533448
	for <lists+freedreno@lfdr.de>; Wed, 25 May 2022 02:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776CE10FB99;
	Wed, 25 May 2022 00:27:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AAD10FBAC
 for <freedreno@lists.freedesktop.org>; Wed, 25 May 2022 00:27:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id f9so38622438ejc.0
 for <freedreno@lists.freedesktop.org>; Tue, 24 May 2022 17:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZFNyhH2PA3ljDR5ctK4z4sd4lSPZnlCyP4REV9FrmG0=;
 b=atWef+0vCmx2JhZX3or/VLDUlzqQvaVadsgA7a2K6VVGhaF69s+puWkmzOaeg0+asP
 O1vbjspHUOIG2pAXNJuiSX+WrGw+bHTpwC9A+ov/SfFm1yYp1mh4oO5HU/qudPE+DYxp
 3+5zkA3cv6irqzWRwOaCYJJqZGcBnVKB4JMCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZFNyhH2PA3ljDR5ctK4z4sd4lSPZnlCyP4REV9FrmG0=;
 b=hTlHpu8wjrFgLVuhPr5it5m0Ozor4Rkpgn6ICfEHIDtf91HgqGZwzg6M2WWh2Xgn9f
 Q5Rcxz1n+TyGH8sxCErY8UJcPnPrN3ZmWP+pottytB1rhrVqKZGRS0o7QygPkVBzxN2n
 IVo9XeRJDOKPH89K8u6wvkn6qaSXT2YHCN/F31YxvrUeoLWn13jTNLBQjpEF46B0I85L
 6iloCLlZ0X6tYSxSK5pJSDozFSQyej3STZvzH5ibY+i8aWrGdGEd93RnwggPtDMFa5V5
 GMiNUsyGeTkOyTVWGS4P8by813czXWMxNE7+xYzgbR7Pg4Kj1tVijHkzYp/7Hd5YYF8R
 rXrw==
X-Gm-Message-State: AOAM531H28Yw7YHwLqfn3KJmV0sShe1fToslbKaa9kM3FspyYLJS45Q8
 T4b01/e3XvVxPpwVY5SF035QjoOcjN9pTzWAqvM=
X-Google-Smtp-Source: ABdhPJx4zGZLrAW6pf5yv7kqNtgZ5h/XfcCBGxLOdJfWd0+AkndRby4FzIy0g9IjAp5CIUW0bDAP3g==
X-Received: by 2002:a17:907:2d09:b0:6fe:c3b8:c448 with SMTP id
 gs9-20020a1709072d0900b006fec3b8c448mr15938221ejc.686.1653438422451; 
 Tue, 24 May 2022 17:27:02 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 m20-20020a50ef14000000b0042ab2127051sm10046891eds.64.2022.05.24.17.27.01
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 17:27:02 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id ck4so34259767ejb.8
 for <freedreno@lists.freedesktop.org>; Tue, 24 May 2022 17:27:01 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr15834745wry.513.1653438047238; Tue, 24
 May 2022 17:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com>
 <1653082028-10211-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-4-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 May 2022 17:20:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vc2zSTHTdneE4yCypg2SO_0xVsEx69BuArDAF3nzSfWA@mail.gmail.com>
Message-ID: <CAD=FV=Vc2zSTHTdneE4yCypg2SO_0xVsEx69BuArDAF3nzSfWA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v11 3/3] drm/msm/dp: delete vdda regulator
 related functions from eDP/DP controller
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, May 20, 2022 at 2:27 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> @@ -101,11 +101,6 @@ struct dp_reg_entry {
>         int disable_load;
>  };
>
> -struct dp_regulator_cfg {
> -       int num;
> -       struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];

You forgot to delete the #define of DP_DEV_REGULATOR_MAX earlier in this file.

Other than that, this looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
