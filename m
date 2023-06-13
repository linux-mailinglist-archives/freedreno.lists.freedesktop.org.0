Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96972EC06
	for <lists+freedreno@lfdr.de>; Tue, 13 Jun 2023 21:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD4810E3DF;
	Tue, 13 Jun 2023 19:34:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE06510E3DD
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 19:34:18 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5187aa14e3bso985538a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686684856; x=1689276856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLMJYRBorT4BFeTxoWUQlILrVOQXKFEtzQp+4QGPj4s=;
 b=cIcvMMxX34Ybq36qD0YDv9yvEekDBh38Er6kkTp3wTXSCTuw4lE9STuSaUaChqcXkm
 8z/uG5xIch5xemadR3GmPtlRxexsgrE7xGVND9Kpzk6cEIKfC6arOtzTdme1YD55o529
 kJbCdFjn3Zvg0VBcyS3ePZqslALm74mE9zvfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686684856; x=1689276856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLMJYRBorT4BFeTxoWUQlILrVOQXKFEtzQp+4QGPj4s=;
 b=LDpdscrgdDp7ApHP/qpCX+i1XlMN+JjItvn5k0hs/TOgKFaRJA/SJiwNSifBYCiF78
 M27xPpwRBzq+ns3Qw7OAKMm5na0pOmWvhZDMCELRNEAL/1u2nDsa7DylOJXllY3RIq9D
 H1Sf1Z4DdXtBWqg1Ap7UpUs2g1KDeSVxCNzLdhH9R18xXTntfNZefQeqkHojCYI+7ef3
 hUwFl3QMvl8Ze2Or9JmHQfoUug1b12k8NwWPKpaHzuRPyu6hcj4l4kt35kohYu1ahozT
 UYcMP7Gs7ctg9gRUyHarpV5+Rh01bkA1dcUUo2GAR2SeepGPyoY3ZlbsLrcFCww6VzOX
 1pJg==
X-Gm-Message-State: AC+VfDzwmInLUGYscxdQdPR3mQ4RIJn8DDknX8mTn8OMekl6uHK/IADl
 tN+sj7I5O99K6bK47gcWjVOcchAzz8GetjFvrchcckfk
X-Google-Smtp-Source: ACHHUZ4Sph0Bj6+CPw0n7RfiMkmJ4J3O4eLjXgRoXwBVfZ28yGbNOMULv1WevkrruCDaarhu+sFSng==
X-Received: by 2002:aa7:c6cc:0:b0:518:5f8e:53b8 with SMTP id
 b12-20020aa7c6cc000000b005185f8e53b8mr3314525eds.13.1686684856391; 
 Tue, 13 Jun 2023 12:34:16 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 z4-20020aa7cf84000000b005187a57fba1sm889827edx.77.2023.06.13.12.34.12
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 12:34:13 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-514ad92d1e3so2833a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 12:34:12 -0700 (PDT)
X-Received: by 2002:a50:bac8:0:b0:507:6632:bbbf with SMTP id
 x66-20020a50bac8000000b005076632bbbfmr11406ede.6.1686684852516; Tue, 13 Jun
 2023 12:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
 <c31ee9e4-1878-c0ae-70e6-42af5fd838c7@linaro.org>
In-Reply-To: <c31ee9e4-1878-c0ae-70e6-42af5fd838c7@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Jun 2023 12:33:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
Message-ID: <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Drop aux devices together with
 DP controller
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 12, 2023 at 3:40=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 13/06/2023 01:01, Bjorn Andersson wrote:
> > Using devres to depopulate the aux bus made sure that upon a probe
> > deferral the EDP panel device would be destroyed and recreated upon nex=
t
> > attempt.
> >
> > But the struct device which the devres is tied to is the DPUs
> > (drm_dev->dev), which may be happen after the DP controller is torn
> > down.
> >
> > Indications of this can be seen in the commonly seen EDID-hexdump full
> > of zeros in the log, or the occasional/rare KASAN fault where the
> > panel's attempt to read the EDID information causes a use after free on
> > DP resources.
> >
> > It's tempting to move the devres to the DP controller's struct device,
> > but the resources used by the device(s) on the aux bus are explicitly
> > torn down in the error path.
>
> I hoped that proper usage of of_dp_aux_populate_bus(), with the callback
> function being non-NULL would have solved at least this part. But it
> seems I'll never see this patch.

Agreed. This has been pending for > 1 year now with no significant
progress. Abhinav: Is there anything that can be done about this? Not
following up on agreed-to cleanups in a timely manner doesn't set a
good precedent. Next time the Qualcomm display wants to land something
and promises to land a followup people will be less likely to believe
them...


> > The KASAN-reported use-after-free also
> > remains, as the DP aux "module" explicitly frees its devres-allocated
> > memory in this code path.
> >
> > As such, explicitly depopulate the aux bus in the error path, and in th=
e
> > component unbind path, to avoid these issues.
> >
> > Fixes: 2b57f726611e ("drm/msm/dp: fix aux-bus EP lifetime")
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
