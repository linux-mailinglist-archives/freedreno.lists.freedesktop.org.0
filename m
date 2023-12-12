Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B3980F96B
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 22:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093E810E6AA;
	Tue, 12 Dec 2023 21:32:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E2810E6AA
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 21:32:51 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-dafe04717baso5979885276.1
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 13:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702416770; x=1703021570; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nAMCWPmOAEyI7QnHbEVFzQzgfOnlTbYbwwq0iE7QXzY=;
 b=XJfB1yzjZD5nZL2lp9wiOVVoG9sRUgJLi8sli2JkYtq5y7kKMQFd7KhE6goIqrlz8O
 HXl/WbXXLJTyrBtBhri6oTjwpeIZLgeHdMN94Jsynf7HFRIjKoCjVKxzpZ6WvOc9SU7j
 LTggbpshNOg8YK5dlz+AhcvPa4g24ibyvsPrNfLAD9iHoLWBU8F3N6oQ9dADOon2HloD
 k3K8AQL3K2SJ4v5xD4EPfLMfhMPTuyS7A3ioDS954lsDoaBnfCTNJguoIMDUamsdoD/+
 VJY6RIBpDl3yVlEFbvNEl63idt+O7Jj3MVXXe9MbxnK9Y6FwJ/F/J+R9W2Vk+ZTEcyyc
 Lvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702416770; x=1703021570;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAMCWPmOAEyI7QnHbEVFzQzgfOnlTbYbwwq0iE7QXzY=;
 b=M+9WFenibfNophnDDTWDwYFXlM5hI6Kd01GmOqD9r06bvw37mHvbjyHGlE3anc4N2y
 FUPqTbNV9EBmf8SnZWcyB5g/U6ijDzxhyfQL2SK/XdFuiy2glqSfcVl5vAeRwls+JgLq
 dwp950WX8kAqRLFpGhdVnzhzbqbjoShtChX49aOHHGD0dxIWoll73sB5raeDkrIveXQM
 HvqkmhdJu28vV8VBtPkg/sXoT9Osor9wInZyB+oAovPAqt0IZHhrK0YRYtcbVURYHHx1
 dDsrgrgOaFVgSiUjoP2MqtuUpR/DqsC3XcdLZw9P7rYQ9YYUt0DCGBBjTVkBtANTAtRz
 q08Q==
X-Gm-Message-State: AOJu0YzDZMsq0o7F1vhwG5H8bGXZFu5WeG0m/VzwUrcuX4Ps0gtNcTXn
 34GvQkPHsqszVvqrmsRN8yl9q+g5Gemhuf1wGgr5UObj1SN7ij0S8O0=
X-Google-Smtp-Source: AGHT+IHwhm79zg1o8Twrfkas2RbpxztHXKT11jxCktgcQzXvIJ4yp5ZwLauwclFvKaPNojWCQqYq1B6yvcIm7JME4n8=
X-Received: by 2002:a81:8305:0:b0:5d4:4bb:2090 with SMTP id
 t5-20020a818305000000b005d404bb2090mr5961876ywf.17.1702416770167; Tue, 12 Dec
 2023 13:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-2-quic_abhinavk@quicinc.com>
 <CAA8EJpqJOh0R1X3i1UGe9hHoezV4uBNDCWPFSdeuXyC6Ju4eHA@mail.gmail.com>
 <59304cf8-33b7-bf27-f9e2-a15e323c869a@quicinc.com>
In-Reply-To: <59304cf8-33b7-bf27-f9e2-a15e323c869a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 23:32:39 +0200
Message-ID: <CAA8EJpr3Gjd-5cw=15g9TNcs1q30_eSzFYpD0_-0fc43VBof1g@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] drm/msm/dpu: add formats check for writeback
 encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, seanpaul@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 19:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2023 10:40 PM, Dmitry Baryshkov wrote:
> > On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> In preparation for adding more formats to dpu writeback add
> >> format validation to it to fail any unsupported formats.
> >>
> >> changes in v3:
> >>          - rebase on top of msm-next
> >>          - replace drm_atomic_helper_check_wb_encoder_state() with
> >>            drm_atomic_helper_check_wb_connector_state() due to the
> >>            rebase
> >>
> >> changes in v2:
> >>          - correct some grammar in the commit text
> >>
> >> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> index bb94909caa25..425415d45ec1 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >> @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>   {
> >>          struct drm_framebuffer *fb;
> >>          const struct drm_display_mode *mode = &crtc_state->mode;
> >> +       int ret;
> >>
> >>          DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
> >>                          phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> >> @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>                  return -EINVAL;
> >>          }
> >>
> >> +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> >> +       if (ret < 0) {
> >> +               DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
> >> +               return ret;
> >> +       }
> >
> > There is no guarantee that there will be no other checks added to this
> > helper. So, I think this message is incorrect. If you wish, you can
> > promote the level of the message in the helper itself.
> > On the other hand, we rarely print such messages by default. Most of
> > the checks use drm_dbg.
> >
>
> hmm...actually drm_atomic_helper_check_wb_connector_state() already has
> a debug message to indicate invalid pixel formats.
>
> You are right, i should perhaps just say that "atomic_check failed" or
> something.
>
> I can make this a DPU_DEBUG. Actually I didnt know that we are not
> supposed to print out atomic_check() errors. Is it perhaps because its
> okay for check to fail?

There are no messages by default there, because otherwise it is so
easy for the user to overspam the dmesg and thus syslog / journal. DoS
on the plate.

>
> But then we would not know why it failed.

Think about the user of X11. They don't see the console. And by
default in the contemporary distros they won't be able to check dmesg.
So if a commit fails, they have to deduce anyway, why did it fail.

>
> >> +
> >>          return 0;
> >>   }
> >>
> >> --
> >> 2.40.1
> >>
> >
> >



-- 
With best wishes
Dmitry
