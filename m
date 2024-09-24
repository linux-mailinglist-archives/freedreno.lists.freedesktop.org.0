Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234B984605
	for <lists+freedreno@lfdr.de>; Tue, 24 Sep 2024 14:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C065B10E8B3;
	Tue, 24 Sep 2024 12:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p65QBzq9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9948C10E8B3
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 12:36:47 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6db67400db4so49527867b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727181406; x=1727786206; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZclqvN8OWviCoeP7W2fOBR9cc4G4ZJZYXXNmxnjQMg0=;
 b=p65QBzq9Rlvuc8ORKuAfB2WhRlRYw2aZ58rvLsQWZVgtExpEdGk15Eoli9HlIiD1nk
 rDHHC/V5DEpcgBqnvtkAw9/9O/8ZXV9yM4Lqp0BbQUoy1zXD85f5xqDPslHSAILXGr/W
 fdRdQA7gh2ZiZtWrd0iAL0qm2zxpM3NJpMGZTDQMdywOwnshjTA1HA1F6mA3ZnG9Otaq
 HALRR/XwoZIrnO8Rvm+xih6KOvKU+lh4Wz79sBMX8W14s8qc1/w8GjxYxRyvmqDHgk0r
 DcRBBFOeJEd/d4BMp2MIWtpSGQPpIjHbjCO8sVC+UuJU6KzJg0C/FchtFbOB1V/2WLIc
 O2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727181406; x=1727786206;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZclqvN8OWviCoeP7W2fOBR9cc4G4ZJZYXXNmxnjQMg0=;
 b=n223IWVnPf+zQdo1aUQqLSBcIDr2B1TAK9Ym1NUY8S9xd8H3D1lk7gL2ToC6+2mDnZ
 dMigpxyGl6K8Kz53R8ZxyuDHqGMIt+rIkasJFWMvmzYRYb/TX+GYuAra3U/WEbLujlTM
 npgt+2wS/bHZfoTFLEBxTTpFTJNiVLzqw2IuwduMcsfGSbg/x12gSFGA4HcL2hCtLMWO
 /Pb4ttUel/LZmBQxyVxnTdsfiD2FgGNpDLdN04VhQxemgFcC9u/pwtallDDNLOOzEcZL
 jWoj3pq5B97Gvvq2skAKpOwbHibySVbd+WCs5pNximVHHGdjgSPPgKarAC8s59H5Ixta
 DRhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe3ci7YoXoPp+idlu/7/nEuvOtdUQmRNjQkRWSosfsOAaUQ3Sf1ZkTOPHebQImL0DKmnkUAf7FE8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxenSBK9BPlw+n5zGJfXOm7r+LL0ifY23/JfHn9iikMHLXACXfn
 b+6IZa9upVYLiRgItsqTqkNh1w9Sky5fELhm9MQratnJeLh16kUR6BcQJuA9UqC62m18OvsNQ0D
 O+ylhVtojlGF2yR+MEMwvSpsiI67/1M5yv123sw==
X-Google-Smtp-Source: AGHT+IGYuEuHzLpsgKnYPKtlxcYnqyLY8yYJBAHJhgxQ8dv64VF7X1Tzkg40TcunXFxtwU+tj7usbv8oLmJYhPL74p4=
X-Received: by 2002:a05:690c:4443:b0:6e2:1062:9b90 with SMTP id
 00721157ae682-6e210629d20mr13188617b3.44.1727181406631; Tue, 24 Sep 2024
 05:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-5-quic_mahap@quicinc.com>
 <v4cnmso3nl5oi3scd2lkg6kepb52vjrzgoti42ikds3y2wq6aw@sbn2yu4xeiun>
 <9b47bd8e-6079-4285-a3d7-932178d5bdf2@quicinc.com>
 <rmndmhq67lajdmva6gt46rqtkvf6jh2afbqazafz6oxv7ep56j@bznopz3aexyt>
 <ba0bc896-41ad-4f1d-9218-fc5a44add422@quicinc.com>
In-Reply-To: <ba0bc896-41ad-4f1d-9218-fc5a44add422@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 14:36:35 +0200
Message-ID: <CAA8EJpqTuj2j4mTKCTGpOX6ZfgGLocmDdwX1BwqEp6OkBejnDg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SA8775P support
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, 
 quic_vpolimer@quicinc.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 24 Sept 2024 at 14:31, Mahadevan P <quic_mahap@quicinc.com> wrote:
>
>
> On 9/24/2024 5:46 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 24, 2024 at 04:42:02PM GMT, Mahadevan P wrote:
> >> On 9/12/2024 1:34 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 12, 2024 at 12:44:36PM GMT, Mahadevan wrote:
> >>>> Add definitions for the display hardware used on the
> >>>> Qualcomm SA8775P platform.
> >>>>
> >>>> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> >>>> ---
> >>>>    .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
> >>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
> >>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
> >>>>    4 files changed, 491 insertions(+), 3 deletions(-)
> >>>>    create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> >>>>
> > [...]
> >
> >>>> +static const struct dpu_intf_cfg sa8775p_intf[] = {
> >>>> +  {
> >>>> +          .name = "intf_0", .id = INTF_0,
> >>>> +          .base = 0x34000, .len = 0x280,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DP,
> >>>> +          .controller_id = MSM_DP_CONTROLLER_0,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> >>>> +  }, {
> >>>> +          .name = "intf_1", .id = INTF_1,
> >>>> +          .base = 0x35000, .len = 0x300,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DSI,
> >>>> +          .controller_id = MSM_DSI_CONTROLLER_0,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> >>>> +          .intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> >>>> +  }, {
> >>>> +          .name = "intf_2", .id = INTF_2,
> >>>> +          .base = 0x36000, .len = 0x300,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DSI,
> >>>> +          .controller_id = MSM_DSI_CONTROLLER_1,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> >>>> +          .intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> >>>> +  }, {
> >>>> +          .name = "intf_3", .id = INTF_3,
> >>>> +          .base = 0x37000, .len = 0x280,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_NONE,
> >>>> +          .controller_id = MSM_DP_CONTROLLER_0,   /* pair with intf_0 for DP MST */
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> >>>> +  }, {
> >>>> +          .name = "intf_4", .id = INTF_4,
> >>>> +          .base = 0x38000, .len = 0x280,
> >>>> +          .features = INTF_SC7280_MASK,
> >>>> +          .type = INTF_DP,
> >>>> +          .controller_id = MSM_DP_CONTROLLER_1,
> >>>> +          .prog_fetch_lines_worst_case = 24,
> >>>> +          .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> >>>> +          .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
> >>>> +  }, {
> >>> Where is intf_5 ?
> >>
> >> intf_5 of base address 0x39000 is not supported on this target.
> > Not supported by whom?
>
>
> In sa8775p mdss architecture intf_5 is not present. So we are not adding
> in SW too.

ack, thanks for the explanation. It's better now.

-- 
With best wishes
Dmitry
