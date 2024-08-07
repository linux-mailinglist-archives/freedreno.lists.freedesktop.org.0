Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74394A611
	for <lists+freedreno@lfdr.de>; Wed,  7 Aug 2024 12:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C578A10E49F;
	Wed,  7 Aug 2024 10:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H7WNOFcd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AA410E49D
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2024 10:46:11 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-1fc56fd4de1so5657425ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Aug 2024 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723027570; x=1723632370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DcfdKUXeiI0RflsU03nEHJTFXU6hNWDJiSM79+Zbsjk=;
 b=H7WNOFcdWdgAucC3VqmrJkkO1OBKAJDelkZRikpNdEyvRhnh/3tyNH+xsIslRSNJUv
 D4OCDpNkaAl4lE6rg+uwmLfKkbesaJkAwdvMD/c5P+upcGFvzg46HB7AUoaeo2Q9vQXQ
 J3lKRgbpHiQqEWF2j9FZbdBISG4XqGc1AEWLNLu8k9x1osvj0TSbJ74ENSF+7jpiHw8q
 /J9KAg4sKRxaqrU5uvoLQ6ajKLbIier/9vzT9zVbnQiX4N100pBSm7cTNLje/bat//md
 DrvwDPB1xIz50mcv01xRXswIc3rjJtkpu8+FHF4yfvxU28o3ToSDk42TcmVtKR3mj9TH
 +rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723027570; x=1723632370;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DcfdKUXeiI0RflsU03nEHJTFXU6hNWDJiSM79+Zbsjk=;
 b=HY0xMHMStjFfd6MLKfu/StFXmR4JjpEg1XVJ89hwMtmxJzQYYUr0uLrT5jiGj63xcP
 hkThAloMUWwf5W3xJZmp+N1GGD2z9mNZJhcIyhibHYbm6omm2lR9w6v6VVGyjGFRfmzz
 izaC9VSU7+abegRn1gLPbLmYC90vIWLXAFVljT3qnMQcbsM9TWds1gWgYzDi1JBZWv6s
 ZZImVgk76LkV1WAkRn8XcVn1t8YkXaKA1U1Gpe5XImoOUx/AQalRemgOE3L/IAOf5m/3
 kYlvOK8Q+5plwMROz5J1k36qSUl0B4l0KmhNlHciGbp1ubE625pjd66blaEZKmKiCzOU
 qFng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBotwZV10R7+YUL7gsA1GdH3I/w0wLucBPHurtnwMLVnODFwiF0ff+2QBko+zD5RYO29ecY/XQD+vquWfOcdUHeztlKyWa7v3Rhql+DWWB
X-Gm-Message-State: AOJu0YynIb+42Td4ZuI3Yo6K7OINmj5dGCHe0G6FYgfZqXzb/5j1pjUx
 iqcdVBQtMhijayHrfDrS2o7o1UgpcbyjUXtxdRBHFbnktT8yT4JrWFASkpx/RTo=
X-Google-Smtp-Source: AGHT+IHj1q9mnqROH1Frx3vYDFQ/RJEPn1e6A0NiqFVGzeKu1qvj297UTqh1jOAY4F0eH5Xa+lNJlg==
X-Received: by 2002:a17:902:e5c6:b0:1fa:1be4:1e48 with SMTP id
 d9443c01a7336-20085418b8cmr23058915ad.11.1723027570477; 
 Wed, 07 Aug 2024 03:46:10 -0700 (PDT)
Received: from [127.0.0.1] ([182.232.168.81]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff592b3fa6sm102793885ad.304.2024.08.07.03.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 03:46:10 -0700 (PDT)
Date: Wed, 07 Aug 2024 17:46:03 +0700
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
 Leonard Lausen <leonard@lausen.nl>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_drm/msm/dpu1=3A_don=27t_c?=
 =?US-ASCII?Q?hoke_on_disabling_the_writeback_connector?=
User-Agent: K-9 Mail for Android
In-Reply-To: <800e03d2-01b0-4bde-816a-e45e1acdd039@quicinc.com>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <800e03d2-01b0-4bde-816a-e45e1acdd039@quicinc.com>
Message-ID: <42B219B7-01DE-47CC-9D31-E27E40C04428@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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

On August 6, 2024 2:19:46 AM GMT+07:00, Abhinav Kumar <quic_abhinavk@quicin=
c=2Ecom> wrote:
>
>
>On 8/2/2024 12:47 PM, Dmitry Baryshkov wrote:
>> During suspend/resume process all connectors are explicitly disabled an=
d
>> then reenabled=2E However resume fails because of the connector_status =
check:
>>=20
>> [ 1185=2E831970] [dpu error]connector not connected 3
>>=20
>> It doesn't make sense to check for the Writeback connected status (and
>> other drivers don't perform such check), so drop the check=2E
>>=20
>> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu=
_writeback=2Ec")
>> Cc: stable@vger=2Ekernel=2Eorg
>> Reported-by: Leonard Lausen <leonard@lausen=2Enl>
>> Closes: https://gitlab=2Efreedesktop=2Eorg/drm/msm/-/issues/57
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec | 3 ---
>>   1 file changed, 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> index 16f144cbc0c9=2E=2E8ff496082902 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback=2Ec
>> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connec=
tor *connector,
>>   	if (!conn_state || !conn_state->connector) {
>>   		DPU_ERROR("invalid connector state\n");
>>   		return -EINVAL;
>> -	} else if (conn_state->connector->status !=3D connector_status_connec=
ted) {
>> -		DPU_ERROR("connector not connected %d\n", conn_state->connector->sta=
tus);
>> -		return -EINVAL;
>>   	}
>
>For this issue, do we hit the connector->force =3D DRM_FORCE_OFF path?

It was hit during the suspend/resume, so yes, it is a forced off, but by t=
he different means=2E

>
>Because otherwise, writeback does not implement =2Edetect() callback toda=
y so its always connected=2E

It is undefined/unkown (3), not connected (1)

>
>But if that was the case how come this error is only for writeback=2E Eve=
n DP has the same connected check in atomic_check()
>
>Change seems fine with me because ideally this seems like a no-op to me b=
ecause writeback connector is assumed to be always connected but the issue =
is missing some details here=2E
>
>>     	crtc =3D conn_state->crtc;
>>=20


--=20
With best wishes
Dmitry
