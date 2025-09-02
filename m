Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46882B402B6
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 15:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0265E10E6DF;
	Tue,  2 Sep 2025 13:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWrpJedp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75610E6DF
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 13:22:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582A8qjO022055
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 13:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lD73ebiFfjAcSdwGcgODwG3ayziIi/umNKznbuOBrsc=; b=nWrpJedp4Xio8Y5X
 iVy5kIuCc+bYttZiZRD9qHjiE536+9bbUZg6wOzoxLhEFI0EDQ+5R5glgJ7cs6sX
 SWe4xSHLhhZR03C3tYnocEvok+qb+f1v4FhOLTuoi1MPG68pBSrLHgezLxg9e/pj
 4/5Z25e6eybZ+nX/JAPj6PDPOqxYnv50UzqQCVLijqbha0IRbL5QhDbSmhfnsWof
 zkmaNAAkb8ZWnlJEwxsHBH+OlVCE+eLZHQrt5Yi0YnOh2kS1ategYuxk0dOEPpDC
 f1JCjhueCvhpRtoujzSRIksPTg34ODBl5enCbBIr3CepDVWJvc4k9HMI87NXphIH
 IXfvkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp82by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 13:22:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7ffb4a65951so840754485a.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 06:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819350; x=1757424150;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lD73ebiFfjAcSdwGcgODwG3ayziIi/umNKznbuOBrsc=;
 b=cvfsemAXCxniPJS1LdmwFUDnRftXNrx0VJZt8/CqKEZkA3YxBZK6mckCDnrAmRIcnW
 fsC25hhm/7ZRKN/le+X8qijB4k27AVEB94cyL9Tv9SUqvPOao6xoZvZm6bjaBUzT+gfC
 lgCdpl+u++LDkTCk4em9FJqK493o96yOmFWwuEopOEPkLjLmnrJytCJiQr8aR5WMtqWi
 hK/viQy6Xq33G08M1fvAaVd6qCx0t0xgh+nHP2msKyjtQjR37fLqcyViA26tFZRWMadP
 TdQX7LBNyr/V8F07G7CDfa6AyfqN83GwQY56umrkhREZPiECmvs5KhxJORsshd/aI5Eq
 R6SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhmhuTynQ3zqZTkaE8Jt3uQpfiZTFLA1u4qPLqA1bI9zRSTa+/bmnTnez97SNYCMAeg/HHr2bO/qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5ZR4EyXludQqW5CeNNYsp/6jF3YieOdxaSTJ+84LGINqM1ZXu
 0CcUHKmHWiPVxq08KFX4FtJoj5M+mPpEyQl1W2SfzoxhCmftDnj1jy2cu1ylOFEOEJan3sKNRi8
 HmIXQ8csPeedMkfce4I75TILnNrtLRbheNa1/0FpML5lvcuV7xLOikEXdwiQfNxx57YcSJ6PpCU
 QW+xA=
X-Gm-Gg: ASbGncswwavlYxZYJI2aRhCd92G1w8eXyeH9aBfF4iM/7oQ6z7TGajyP28HnZDQ4/IA
 NOXOEf71sBZSXnwPGhOWWhe17TsjhE50xmTq/hvofOca0w/Js7LEHJe19yfCFalUCOVa5DyKuBh
 S/WPBcLWLCW2G/3VutJvOBzdfjxqbjBh140X2K+GxmElBLZEfNCdup2TFyJtwXF2eQ8HtNaOa92
 uDv0232xpTH6LM8PndYzYlgqlkDd/VNf6Y8YM4j3RSR4VwYTuU90+RPf+gw4UbTI46l5csglCpF
 yiYGXV39xNcqGzhPB4obWXWojjxBMKi5GFXBqak0LRw6U9ywMEfUVVgouNOsNA==
X-Received: by 2002:a05:620a:19a7:b0:7e8:3c18:9859 with SMTP id
 af79cd13be357-7ff26eab048mr1210114185a.2.1756819349497; 
 Tue, 02 Sep 2025 06:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd4VwxuS1eGRypUe4kM4U6jYmO0Ezi3tIVq6bOYrcgkw40C61F2D+N3HvW7dh77+xCl7mZkA==
X-Received: by 2002:a05:6a00:2194:b0:772:7251:7148 with SMTP id
 d2e1a72fcca58-772725173a8mr2742364b3a.27.1756818988929; 
 Tue, 02 Sep 2025 06:16:28 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm13790790b3a.18.2025.09.02.06.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:16:28 -0700 (PDT)
Message-ID: <d909d5ec-4223-4b9d-abbe-176672ff7f0a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:46:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm: Fix bootup splat with separate_gpu_drm
 modparam
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-1-f3ec9baed513@oss.qualcomm.com>
 <2mhq73sckc3x7rqvllbmfk3qwla2lqqidchecogytxyramoeu5@66j7zupcni2i>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2mhq73sckc3x7rqvllbmfk3qwla2lqqidchecogytxyramoeu5@66j7zupcni2i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2CCNkyv2I9uTgd4n-VmFnUwLrMG8PFyk
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6ef96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gUvfbfcqA5cecSJ7q00A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2CCNkyv2I9uTgd4n-VmFnUwLrMG8PFyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4gCkG57ojZPO
 P/KY27i87rTcBWTNRRZVatMkTKkbtrftjjsI+MyI8841oTwhVOFO0AHwjMCWHJD8Y57YdE/+uoO
 aOROGT2RN/G7fsOY15hVwxexHM4xUn+e86p9ctb9rfmariF6z5s7UN7qLOwdYTm5T/4aminCVSA
 FvdNIrlg8FeU+cK7GV3DmhTItDmEXQ/LigSLyztEWa7hUi04AUY1UUbeavnFKOm1SY7DxxFncy8
 M069ng5HvI1vlWstDdJW+/zWENViBiNX7EO+IQ9uzry/C+ebezIYmCIVuEhIm4Qq1i0BntlCamL
 9UTC4I55o7RuhIC3c+FDFd+aM0WDd2wTsP0P9/3ZLU3HfA2GlcKF2WzLaXRN2kXWsIuUyoLY7nq
 TNYN/ELU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On 9/2/2025 5:57 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 05:20:00PM +0530, Akhil P Oommen wrote:
>> The drm_gem_for_each_gpuvm_bo() call from lookup_vma() accesses
>> drm_gem_obj.gpuva.list, which is not initialized when the drm driver
>> does not support DRIVER_GEM_GPUVA feature. Enable it for msm_kms
>> drm driver to fix the splat seen when msm.separate_gpu_drm=1 modparam
>> is set:
>>
>> [    9.506020] Unable to handle kernel paging request at virtual address fffffffffffffff0
>> [    9.523160] Mem abort info:
>> [    9.523161]   ESR = 0x0000000096000006
>> [    9.523163]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    9.523165]   SET = 0, FnV = 0
>> [    9.523166]   EA = 0, S1PTW = 0
>> [    9.523167]   FSC = 0x06: level 2 translation fault
>> [    9.523169] Data abort info:
>> [    9.523170]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>> [    9.523171]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> [    9.523172]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [    9.523174] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000ad370f000
>> [    9.523176] [fffffffffffffff0] pgd=0000000000000000, p4d=0000000ad4787403, pud=0000000ad4788403, pmd=0000000000000000
>> [    9.523184] Internal error: Oops: 0000000096000006 [#1]  SMP
>> [    9.592968] CPU: 9 UID: 0 PID: 448 Comm: (udev-worker) Not tainted 6.17.0-rc4-assorted-fix-00005-g0e9bb53a2282-dirty #3 PREEMPT
>> [    9.592970] Hardware name: Qualcomm CRD, BIOS 6.0.240718.BOOT.MXF.2.4-00515-HAMOA-1 07/18/2024
>> [    9.592971] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>> [    9.592973] pc : lookup_vma+0x28/0xe0 [msm]
>> [    9.592996] lr : get_vma_locked+0x2c/0x128 [msm]
>> [    9.763632] sp : ffff800082dab460
>> [    9.763666] Call trace:
>> [    9.763668]  lookup_vma+0x28/0xe0 [msm] (P)
>> [    9.763688]  get_vma_locked+0x2c/0x128 [msm]
>> [    9.763706]  msm_gem_get_and_pin_iova_range+0x68/0x11c [msm]
>> [    9.763723]  msm_gem_get_and_pin_iova+0x18/0x24 [msm]
>> [    9.763740]  msm_fbdev_driver_fbdev_probe+0xd0/0x258 [msm]
>> [    9.763760]  __drm_fb_helper_initial_config_and_unlock+0x288/0x528 [drm_kms_helper]
>> [    9.763771]  drm_fb_helper_initial_config+0x44/0x54 [drm_kms_helper]
>> [    9.763779]  drm_fbdev_client_hotplug+0x84/0xd4 [drm_client_lib]
>> [    9.763782]  drm_client_register+0x58/0x9c [drm]
>> [    9.763806]  drm_fbdev_client_setup+0xe8/0xcf0 [drm_client_lib]
>> [    9.763809]  drm_client_setup+0xb4/0xd8 [drm_client_lib]
>> [    9.763811]  msm_drm_kms_post_init+0x2c/0x3c [msm]
>> [    9.763830]  msm_drm_init+0x1a8/0x22c [msm]
>> [    9.763848]  msm_drm_bind+0x30/0x3c [msm]
>> [    9.919273]  try_to_bring_up_aggregate_device+0x168/0x1d4
>> [    9.919283]  __component_add+0xa4/0x170
>> [    9.919286]  component_add+0x14/0x20
>> [    9.919288]  msm_dp_display_probe_tail+0x4c/0xac [msm]
>> [    9.919315]  msm_dp_auxbus_done_probe+0x14/0x20 [msm]
>> [    9.919335]  dp_aux_ep_probe+0x4c/0xf0 [drm_dp_aux_bus]
>> [    9.919341]  really_probe+0xbc/0x298
>> [    9.919345]  __driver_probe_device+0x78/0x12c
>> [    9.919348]  driver_probe_device+0x40/0x160
>> [    9.919350]  __driver_attach+0x94/0x19c
>> [    9.919353]  bus_for_each_dev+0x74/0xd4
>> [    9.919355]  driver_attach+0x24/0x30
>> [    9.919358]  bus_add_driver+0xe4/0x208
>> [    9.919360]  driver_register+0x60/0x128
>> [    9.919363]  __dp_aux_dp_driver_register+0x24/0x30 [drm_dp_aux_bus]
>> [    9.919365]  atana33xc20_init+0x20/0x1000 [panel_samsung_atna33xc20]
>> [    9.919370]  do_one_initcall+0x6c/0x1b0
>> [    9.919374]  do_init_module+0x58/0x234
>> [    9.919377]  load_module+0x19cc/0x1bd4
>> [    9.919380]  init_module_from_file+0x84/0xc4
>> [    9.919382]  __arm64_sys_finit_module+0x1b8/0x2cc
>> [    9.919384]  invoke_syscall+0x48/0x110
>> [    9.919389]  el0_svc_common.constprop.0+0xc8/0xe8
>> [    9.919393]  do_el0_svc+0x20/0x2c
>> [    9.919396]  el0_svc+0x34/0xf0
>> [    9.919401]  el0t_64_sync_handler+0xa0/0xe4
>> [    9.919403]  el0t_64_sync+0x198/0x19c
>> [    9.919407] Code: eb0000bf 54000480 d100a003 aa0303e2 (f8418c44)
>> [    9.919410] ---[ end trace 0000000000000000 ]---
> 
> Nit: usually you can drop timestamps from the kernel log.

Missed my eyes. Will update in v2.

-Akhil.

> 
>>
>> Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

