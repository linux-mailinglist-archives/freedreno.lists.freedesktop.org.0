Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C716263B5
	for <lists+freedreno@lfdr.de>; Fri, 11 Nov 2022 22:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CA910E1A2;
	Fri, 11 Nov 2022 21:37:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D010E1C1
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 21:37:42 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id z1so3761992qkl.9
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 13:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=nc4n1MTPVmkik2WRUCGka6QmClvTwjaiaovnK4SperE=;
 b=fDo4uxcNfAiq0x5mVY0eM+CWr38FvRpzhoVWYbnPCtRzGjnljA7CZirv4+Bn/+bpt3
 5i+Wp9D6oWtkPhhIg23rl8anfUHEYGwF0j11iUC5HVaSvebVKcVrXmB9P95sI4DBEEtv
 S6QePXbYpwq97x0tlNe2PcQ5flJtzqEtAa35k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nc4n1MTPVmkik2WRUCGka6QmClvTwjaiaovnK4SperE=;
 b=8A4S2PwJvg9xqwkOHMPWBGBem3atwhyB9Qp8dl4jEr5UxvAZkolnkdmEXG0F9N38Zv
 WsCWZA9eY3B+b2oUygdf7qAz1no2YwIMIGOIeBOAYRXEczdQHGnj/H03WjdTs3eBfdW6
 fcapGzaCaiz2Vo8zqyaK4p97xhFqji8VmfaL9ZFMuQkwnZwzpg5xkfgEBW8ZeepJwUGN
 kcyD0gWYHvQuATvKs72343dxycIs9QFY7XVudhVxqSE2C3o0pFMZAho/RgOtalbOyqRO
 dHQP5Qot+XGmjmH7w07XOc2gnvNYSICU6sFtBcZ4Py5A6vLeuYAzQ71sqo7Yte32eH+J
 bseQ==
X-Gm-Message-State: ANoB5pkJEX37797C8xIbrmzIUb5/l33u2HbycHuqf49n72lyMWELupT1
 x/zhcpaUyFFwPdZsf+L2wleCZg==
X-Google-Smtp-Source: AA0mqf5nEGbuZxf99shvh2YzmRaM9mpNQ3mhcYP9R9XUcct4V4ILREu7/+AVJfG3muZTxkWwcEm9MA==
X-Received: by 2002:a05:620a:16a9:b0:6ec:5735:2e25 with SMTP id
 s9-20020a05620a16a900b006ec57352e25mr2837685qkj.636.1668202661514; 
 Fri, 11 Nov 2022 13:37:41 -0800 (PST)
Received: from smtpclient.apple (c-73-148-104-166.hsd1.va.comcast.net.
 [73.148.104.166]) by smtp.gmail.com with ESMTPSA id
 y23-20020a37f617000000b006fa22f0494bsm2008147qkj.117.2022.11.11.13.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 13:37:40 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Mime-Version: 1.0 (1.0)
Date: Fri, 11 Nov 2022 16:37:40 -0500
Message-Id: <F4D72FA8-C1D1-46ED-B56E-8BEFBB297E4A@joelfernandes.org>
References: <899db0f8-7b8a-ed8f-30b8-4f630da1298d@quicinc.com>
In-Reply-To: <899db0f8-7b8a-ed8f-30b8-4f630da1298d@quicinc.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: iPhone Mail (19G82)
Subject: Re: [Freedreno] [PATCH 2/2] adreno: Detect shutdown during
 get_param()
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Ross Zwisler <zwisler@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



> On Nov 11, 2022, at 4:28 PM, Akhil P Oommen <quic_akhilpo@quicinc.com> wro=
te:
>=20
> =EF=BB=BFOn 11/12/2022 1:19 AM, Joel Fernandes (Google) wrote:
>> Even though the GPU is shut down, during kexec reboot we can have userspa=
ce
>> still running. This is especially true if KEXEC_JUMP is not enabled, beca=
use we
>> do not freeze userspace in this case.
>>=20
>> To prevent crashes, track that the GPU is shutdown and prevent get_param(=
) from
>> accessing GPU resources if we find it shutdown.
>>=20
>> This fixes the following crash during kexec reboot on an ARM64 device wit=
h adreno GPU:
>>=20
>> [  292.534314] Kernel panic - not syncing: Asynchronous SError Interrupt
>> [  292.534323] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
>> [  292.534326] Call trace:
>> [  292.534328]  dump_backtrace+0x0/0x1d4
>> [  292.534337]  show_stack+0x20/0x2c
>> [  292.534342]  dump_stack_lvl+0x60/0x78
>> [  292.534347]  dump_stack+0x18/0x38
>> [  292.534352]  panic+0x148/0x3b0
>> [  292.534357]  nmi_panic+0x80/0x94
>> [  292.534364]  arm64_serror_panic+0x70/0x7c
>> [  292.534369]  do_serror+0x0/0x7c
>> [  292.534372]  do_serror+0x54/0x7c
>> [  292.534377]  el1h_64_error_handler+0x34/0x4c
>> [  292.534381]  el1h_64_error+0x7c/0x80
>> [  292.534386]  el1_interrupt+0x20/0x58
>> [  292.534389]  el1h_64_irq_handler+0x18/0x24
>> [  292.534395]  el1h_64_irq+0x7c/0x80
>> [  292.534399]  local_daif_inherit+0x10/0x18
>> [  292.534405]  el1h_64_sync_handler+0x48/0xb4
>> [  292.534410]  el1h_64_sync+0x7c/0x80
>> [  292.534414]  a6xx_gmu_set_oob+0xbc/0x1fc
>> [  292.534422]  a6xx_get_timestamp+0x40/0xb4
>> [  292.534426]  adreno_get_param+0x12c/0x1e0
>> [  292.534433]  msm_ioctl_get_param+0x64/0x70
>> [  292.534440]  drm_ioctl_kernel+0xe8/0x158
>> [  292.534448]  drm_ioctl+0x208/0x320
>> [  292.534453]  __arm64_sys_ioctl+0x98/0xd0
>> [  292.534461]  invoke_syscall+0x4c/0x118
>> [  292.534467]  el0_svc_common+0x98/0x104
>> [  292.534473]  do_el0_svc+0x30/0x80
>> [  292.534478]  el0_svc+0x20/0x50
>> [  292.534481]  el0t_64_sync_handler+0x78/0x108
>> [  292.534485]  el0t_64_sync+0x1a4/0x1a8
>> [  292.534632] Kernel Offset: 0x1a5f800000 from 0xffffffc008000000
>> [  292.534635] PHYS_OFFSET: 0x80000000
>> [  292.534638] CPU features: 0x40018541,a3300e42
>> [  292.534644] Memory Limit: none
>>=20
>> Cc: Rob Clark <robdclark@chromium.org>
>> Cc: Steven Rostedt <rostedt@goodmis.org>
>> Cc: Ricardo Ribalda <ribalda@chromium.org>
>> Cc: Ross Zwisler <zwisler@kernel.org>
>> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 +-
>>  drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
>>  3 files changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
>> index f0cff62812c3..03d912dc0130 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -612,6 +612,7 @@ static void adreno_shutdown(struct platform_device *p=
dev)
>>  {
>>      struct msm_gpu *gpu =3D dev_to_gpu(&pdev->dev);
>>  +    gpu->is_shutdown =3D true;
>>      WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
>>  }
>>  diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/m=
sm/adreno/adreno_gpu.c
>> index 382fb7f9e497..6903c6892469 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -251,7 +251,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_=
file_private *ctx,
>>      struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>>        /* No pointer params yet */
>> -    if (*len !=3D 0)
>> +    if (*len !=3D 0 || gpu->is_shutdown)
>>          return -EINVAL;
> This will race with shutdown.

Could you clarify what you mean? At this point in the code, the shutdown is c=
ompleted and it crashes here.

> Probably, propagating back the return value of pm_runtime_get() in every p=
ossible ioctl call path is the right thing to do.

Ok I=E2=80=99ll look into that. But the patch I posted works reliably and fi=
xes all crashes we could reproduce.

> I have never thought about this scenario. Do you know why userspace is not=
 freezed before kexec?

I am not sure. It depends on how kexec is used. The userspace freeze happens=
 only when kexec is called to switch back and forth between different kernel=
s (persistence mode). In such scenario I believe the userspace has to be fro=
zen and unfrozen. However for normal kexec, that does not happen.

Thanks.


>=20
> -Akhil.
>>        switch (param) {
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
>> index ff911e7305ce..f18b0a91442b 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>> @@ -214,6 +214,9 @@ struct msm_gpu {
>>      /* does gpu need hw_init? */
>>      bool needs_hw_init;
>>  +    /* is the GPU shutdown? */
>> +    bool is_shutdown;
>> +
>>      /**
>>       * global_faults: number of GPU hangs not attributed to a particular=

>>       * address space
>=20
