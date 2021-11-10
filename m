Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30244C7E9
	for <lists+freedreno@lfdr.de>; Wed, 10 Nov 2021 19:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242A7891AB;
	Wed, 10 Nov 2021 18:55:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9141891AB;
 Wed, 10 Nov 2021 18:55:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2727488wmd.1; 
 Wed, 10 Nov 2021 10:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tPV4NJmx7yNNZMUNac4JIpjNtAvs89vq/kypIKzi6mk=;
 b=kOOV6fzTJvc3Yiz35aw21yoO+xHJaFcL37Wq7IwwypxUJzMa7QJwTZC+BmKxhh1ECu
 A3jMtEc/KS8krv+bSFVpdifxITbW8DcmJBA4NGc4IuXRHNA8nb0WnvsR5zX/cm34B2Np
 fxH7tRPxYOKMO8sRv03Z/zB1Ej+pzY9/HUXVAzMVR5MESvbbQQa4U8tnF06L9DWjik/n
 SKq5OAtlDttfBSjuY5sf09rHoXQi3fQiU4f6+gtYOynXKIOH1rtBBklmZxeimwNa4jOc
 MpTBr9MiaJKre636hKc/UpaFXO49PtPq+7Y85uhJ81pndL1dZ0hwfaId5oDLP1sK1OYx
 nBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tPV4NJmx7yNNZMUNac4JIpjNtAvs89vq/kypIKzi6mk=;
 b=bp4oEZ5kbN+FN+Vqpz4qku4P75EramJ0/G46pM+wO27Skyou5vet8SBwB8d+xxb/LF
 IjW71nsC6XOCdD+gYM3rF7Asvh61q6ShHuc3x0Fp05kXJO0VHEIw0jQRRd/QpuG2aXCg
 QB+dq286HuRudrJMl/VJQ6/HE3MO+g2muVUeQzqiaCCFHB4oooN3sfkGseNKOsZdgpK4
 PqclPkkeK0WVyanaORtPO5hqREApE49YXJBKNcpBonu8/v6GNT3bxm2YqXnFCdt9zpFd
 s5nJ6TtseQaBus0gBlNG40IIH/d+NEoMXQ6cX/Eg//22WNY25S/nD2Pd0zKlsMWEhbVL
 X+uQ==
X-Gm-Message-State: AOAM533QR7dZTnMVhc6zcZYubi6/aH5m0rnpNEJbblZ8k6ZZchsnnfT/
 3kIFdy+V6A64F0Bov5/CY9zwD+Km7Q79F9uU0JwtXDxzUx4=
X-Google-Smtp-Source: ABdhPJy27fyaIRYObDSt0lrG8hRk7u+ySYzQ3UaZXwipXrKO78xYYqY+Xs6TVPLQzGRNqgh8Iidm9XhoRnlihGz5Qd4=
X-Received: by 2002:a1c:790d:: with SMTP id l13mr19221239wme.101.1636570542976; 
 Wed, 10 Nov 2021 10:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20211110184213.649787-1-robdclark@gmail.com>
 <20211110184213.649787-4-robdclark@gmail.com>
In-Reply-To: <20211110184213.649787-4-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Nov 2021 11:00:41 -0800
Message-ID: <CAF6AEGsh4ow448Y5xtt2rnX=zcFCQvqk9Mf59AB_ifmw9mm0Lw@mail.gmail.com>
To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH igt v2 3/3] msm: Add recovery tests
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
Cc: Rob Clark <robdclark@chromium.org>, Petri Latvala <petri.latvala@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 10:37 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add tests to exercise:
>
> 1. sw hangcheck timeout
> 2. gpu fault (hang) recovery
> 3. iova fault recovery
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_msm.h        |   3 +
>  tests/meson.build    |   1 +
>  tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 tests/msm_recovery.c
>
> diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> index 1a66c806..421d23ed 100644
> --- a/lib/igt_msm.h
> +++ b/lib/igt_msm.h
> @@ -97,6 +97,9 @@ enum adreno_pm4_packet_type {
>
>  enum adreno_pm4_type3_packets {
>         CP_NOP =3D 16,
> +       CP_WAIT_MEM_GTE =3D 20,
> +       CP_WAIT_REG_MEM =3D 60,
> +       CP_MEM_WRITE =3D 61,
>  };
>
>  static inline unsigned
> diff --git a/tests/meson.build b/tests/meson.build
> index 0af3e03a..166e3494 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -60,6 +60,7 @@ test_progs =3D [
>         'kms_vrr',
>         'kms_writeback',
>         'meta_test',
> +       'msm_recovery',
>         'msm_submit',
>         'panfrost_get_param',
>         'panfrost_gem_new',
> diff --git a/tests/msm_recovery.c b/tests/msm_recovery.c
> new file mode 100644
> index 00000000..b71326b8
> --- /dev/null
> +++ b/tests/msm_recovery.c
> @@ -0,0 +1,172 @@
> +/*
> + * Copyright =C2=A9 2021 Google, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <sys/poll.h>
> +
> +#include "igt.h"
> +#include "igt_msm.h"
> +
> +static struct msm_device *dev;
> +static struct msm_bo *scratch_bo;
> +static uint32_t *scratch;
> +
> +/*
> + * Helpers for cmdstream packet building:
> + */
> +
> +static void
> +wait_mem_gte(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t ref)
> +{
> +       msm_cmd_pkt7(cmd, CP_WAIT_MEM_GTE, 4);
> +       msm_cmd_emit(cmd, 0);                              /* RESERVED */
> +       msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* POLL_ADDR_L=
O/HI */
> +       msm_cmd_emit(cmd, ref);                            /* REF */
> +}
> +
> +static void
> +mem_write(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t val)
> +{
> +       msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> +       msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* ADDR_LO/HI =
*/
> +       msm_cmd_emit(cmd, val);                            /* VAL */
> +}
> +
> +/*
> + * Helper to wait on a fence-fd:
> + */
> +static void
> +wait_and_close(int fence_fd)
> +{
> +       poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
> +       close(fence_fd);
> +}
> +
> +/*
> + * Helper for hang tests.  Emits multiple submits, with one in the middl=
e
> + * that triggers a fault, and confirms that the submits before and after
> + * the faulting one execute properly, ie. that the driver properly manag=
es
> + * to recover and re-queue the submits after the faulting submit;
> + */
> +static void
> +do_hang_test(struct msm_pipe *pipe)
> +{
> +       struct msm_cmd *cmds[16];
> +       int fence_fds[ARRAY_SIZE(cmds)];
> +
> +       memset(scratch, 0, 0x1000);
> +
> +       for (unsigned i =3D 0; i < ARRAY_SIZE(cmds); i++) {
> +               struct msm_cmd *cmd =3D igt_msm_cmd_new(pipe, 0x1000);
> +
> +               cmds[i] =3D cmd;
> +
> +               /*
> +                * Emit a packet to wait for scratch[0] to be >=3D 1
> +                *
> +                * This lets us force the GPU to wait until all the cmdst=
ream is
> +                * queued up.
> +                */
> +               wait_mem_gte(cmd, 0, 1);
> +
> +               if (i =3D=3D 10) {
> +                       msm_cmd_emit(cmd, 0xdeaddead);
> +               }
> +
> +               /* Emit a packet to write scratch[1+i] =3D 2+i: */
> +               mem_write(cmd, 1+i, 2+i);
> +       }
> +
> +       for (unsigned i =3D 0; i < ARRAY_SIZE(cmds); i++) {
> +               fence_fds[i] =3D igt_msm_cmd_submit(cmds[i]);
> +       }
> +
> +       usleep(10000);
> +
> +       /* Let the WAIT_MEM_GTE complete: */
> +       scratch[0] =3D 1;
> +
> +       for (unsigned i =3D 0; i < ARRAY_SIZE(cmds); i++) {
> +               wait_and_close(fence_fds[i]);
> +               igt_msm_cmd_free(cmds[i]);
> +               if (i =3D=3D 10)
> +                       continue;
> +               igt_assert_eq(scratch[1+i], 2+i);
> +       }
> +}
> +
> +/*
> + * Tests for drm/msm hangcheck, recovery, and fault handling
> + */
> +
> +igt_main
> +{
> +       static struct msm_pipe *pipe =3D NULL;
> +
> +       igt_fixture {
> +               dev =3D igt_msm_dev_open();
> +               pipe =3D igt_msm_pipe_open(dev, 0);
> +               scratch_bo =3D igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> +               scratch =3D igt_msm_bo_map(scratch_bo);
> +       }
> +
> +       igt_describe("Test sw hangcheck handling");
> +       igt_subtest("hangcheck") {
> +               igt_require(dev->gen >=3D 6);
> +
> +               /* Disable hw hang detection to force fallback to sw hang=
check: */
> +               igt_debugfs_write(dev->fd, "disable_err_irq", "Y");

note that this depends on [1].. not sure if there is any constraint
about landing igt tests before some debugfs they depend on lands
upstream on the kernel side?

[1] https://patchwork.freedesktop.org/patch/462625/?series=3D96725&rev=3D1

BR,
-R

> +
> +               do_hang_test(pipe);
> +
> +               igt_debugfs_write(dev->fd, "disable_err_irq", "N");
> +       }
> +
> +       igt_describe("Test hw fault handling");
> +       igt_subtest("gpu-fault") {
> +               igt_require(dev->gen >=3D 6);
> +
> +               do_hang_test(pipe);
> +       }
> +
> +       igt_describe("Test iova fault handling");
> +       igt_subtest("iova-fault") {
> +               struct msm_cmd *cmd;
> +
> +               igt_require(dev->gen >=3D 6);
> +
> +               cmd =3D igt_msm_cmd_new(pipe, 0x1000);
> +
> +               msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> +               msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
> +               msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
> +               msm_cmd_emit(cmd, 0x123);                /* VAL */
> +
> +               wait_and_close(igt_msm_cmd_submit(cmd));
> +       }
> +
> +       igt_fixture {
> +               igt_msm_bo_free(scratch_bo);
> +               igt_msm_pipe_close(pipe);
> +               igt_msm_dev_close(dev);
> +       }
> +}
> --
> 2.31.1
>
