Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04E7867AE7
	for <lists+freedreno@lfdr.de>; Mon, 26 Feb 2024 16:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6713F10E792;
	Mon, 26 Feb 2024 15:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jJPx5ERP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3613A10E792
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 15:56:31 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a3e7ce7dac9so355310766b.1
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 07:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708962988; x=1709567788;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTNfxtjjEuUsYp1JNTlYg2x2iUW0rS+mI/kNL5uqq8k=;
 b=jJPx5ERP5GZ2+efbAY9fflcK5Gaa45Ae2m3t6v8FX2Musq4K1n64KenBjDi8dxdbDs
 DRLauxpHh/Uy7nw/sbWzUb0huOKRB2GUJ6T97nL7+QVHmSH/lY7BO4Rgpt10aKcTPy2+
 vgb6kY2V9Jae4VSKaGHtltdzV6/JjoA3pSwKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962988; x=1709567788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTNfxtjjEuUsYp1JNTlYg2x2iUW0rS+mI/kNL5uqq8k=;
 b=e+iv4P6AWVE/RLIVq0RKnOVUDiC1uUm3Vyt3gKY4NaMpeZ7NpUPeU/uwVmQ9ybAowZ
 AHDugDIdZPMw55wxJAC2U+ASnpzWUgdmWCt/xF3TQVgPB7B4HUnI/T3qkj0ZA5IkmWR8
 Zn1sVG9i+CfnSvCc0Aq4dQ5gAQJPOj0W+eIDl3yL/u3SRw6fEldQLLCWb3JOI5a+smDP
 IAxDEWA225bfId5OT+XN8l+ezRzSzeNMq5RyUAhdZNsxCxTr8C7t/JChBIf+tfd4hXxk
 x128RaQeSdLo4VO+NOZmDzNGbLCIuUyQYArgxUuMFXASsCS5X5fi/eW8PMgmzEDu5/Xd
 N6Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSp103/3wvuw30vwhgd7GWtIq1+a5f0lwaotc5EKyAfEvyolqvzAVO+VsZcJ0aMyX904KSot7bL+Pw9hDHGZdwe6kwJw1aK/WVS3Q+KeRm
X-Gm-Message-State: AOJu0YyXKf99Tw3G2J4rpJ+PzfV+a5pctomw44D0XO9p7411UowTUe6F
 vzJ51/jKjKv+Ft+R4W+GbQU1eoI8BwAZL87JxKWw7ADygnAZkmY5qlmdcuQb8HEpvGaqBpqoBbx
 F1Q==
X-Google-Smtp-Source: AGHT+IELCXf5lded/VNW26PAaZSPKlXoLw1290SRIaRolB+i5cXFLq9w0DjIqYDIm50FeWMRtGTeIg==
X-Received: by 2002:a17:906:e298:b0:a42:f0cc:c573 with SMTP id
 gg24-20020a170906e29800b00a42f0ccc573mr4708607ejb.16.1708962988293; 
 Mon, 26 Feb 2024 07:56:28 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 vk3-20020a170907cbc300b00a42fe08081fsm2217775ejc.47.2024.02.26.07.56.26
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 07:56:27 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-56619428c41so5891a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 Feb 2024 07:56:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMef9hfz1/G88aDQgsUGXEE+qHeqTmb9eeNCmmfz+amekvZhcKqDNzmG7DLa0BB1CpEDvPJEQdHU3Eqq9LyA8xG77BWTwUX8DSFEjNcTeS
X-Received: by 2002:a50:9f28:0:b0:562:9d2:8857 with SMTP id
 b37-20020a509f28000000b0056209d28857mr330238edf.6.1708962985791; Mon, 26 Feb
 2024 07:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
 <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
 <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
 <20240222150423.GI2936378@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqd=1KV_dN8AURQDcFDDyO+YtbC59gM7ftt+HohGM93hg@mail.gmail.com>
In-Reply-To: <CAA8EJpqd=1KV_dN8AURQDcFDDyO+YtbC59gM7ftt+HohGM93hg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Feb 2024 07:56:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XJVFX-GkL-wiAoi=r6tdiDHkJ_aFSpx6FE6+gFT5xJjA@mail.gmail.com>
Message-ID: <CAD=FV=XJVFX-GkL-wiAoi=r6tdiDHkJ_aFSpx6FE6+gFT5xJjA@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Thu, Feb 22, 2024 at 9:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 22 Feb 2024 at 17:04, Bjorn Andersson <quic_bjorande@quicinc.com>=
 wrote:
> >
> > On Thu, Feb 22, 2024 at 11:46:26AM +0200, Dmitry Baryshkov wrote:
> > > On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org=
> wrote:
> > > >
> > > >
> > > >
> > > > On 2/22/24 10:04, Dmitry Baryshkov wrote:
> > > > > On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
> > > > >>
> > > > >>
> > > > >>
> > > > >> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> > > > >>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@qu=
icinc.com> wrote:
> > > > >>>>
> > > > >>>> The max frequency listed in the DPU opp-table is 506MHz, this =
is not
> > > > >>>> sufficient to drive a 4k@60 display, resulting in constant und=
errun.
> > > > >>>>
> > > > >>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-t=
able to
> > > > >>>> fix this.
> > > > >>>
> > > > >>> I think we might want to keep this disabled for ChromeOS device=
s. Doug?
> > > > >>
> > > > >> ChromeOS devices don't get a special SoC
> > > > >
> > > > > But they have the sc7280-chrome-common.dtsi, which might contain =
a
> > > > > corresponding /delete-node/ .
> > > >
> > > > What does that change? The clock rates are bound to the
> > > > SoC and the effective values are limited by link-frequencies
> > > > or the panel driver.
> > >
> > > Preventing the DPU from overheating? Or spending too much power?
> > >
> >
> > Perhaps I'm misunderstanding the implementation then, are we always
> > running at the max opp? I thought the opp was selected based on the
> > current need for performance?
>
> Yes. My concern was whether the Chrome people purposely skipped this
> top/turbo freq for any reason. In such a case, surprising them by
> adding it to all platforms might be not the best idea. I hope Doug can
> comment here.

Thanks for thinking of us! In this case, I think the only users left
of the sc7280 Chrome devices are folks like Rob and then a few folks
on Qualcomm's display team (like Abhinav), so if they're happy with
the change then I have no objections.

In any case, I'm not aware of any reason why this would have been
skipped for Chrome. The Chrome devices were always intended to support
4K so I assume this was an oversight and nothing more. ...of course,
as Abhinav points out Chrome devices are currently limited to HBR2 + 2
lanes DP so they can't go 4K60 anyway.

In any case, in case it matters, feel free to have:

Acked-by: Douglas Anderson <dianders@chromium.org>
