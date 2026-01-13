Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77FD1A412
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCCC89E1D;
	Tue, 13 Jan 2026 16:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6MtjU47";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blJvBBkB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE3E89E1D
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:29:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DEVFtd1935027
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cIn5H/EXHlleEAeuN1rT2GBX
 pPo6fP2DFr4Mp6yQNT0=; b=h6MtjU47w1PHnUFq0KDb/GRAfBi1JEHu2lTMIpyc
 cqAD+bc1LGy8/TG/gfUjoEiqzQmuk+kyMYsqOX6aqMyevJPuhwCkJUFBj3Rt8aVG
 +ufCmNSUcu+UF5tCQSOyhiPWfUC4Kn0Wa5H23HJdxo72W0y6hF5B8xdfnvsYdi2W
 ipinFNeNUHPEZnaabab9G93Qcw9UdAI8Zaa+c6cbmoGJRFLcfkx3Y0pp5I+Ujoe8
 GNlxjYt69KuxsvIiz2/W3J6fNXVd/LXNyHBlosiUcMffL4FX2PoPw2okX7CUh2Mq
 it8SOOvW2CCXVHDJFUqdg+DIgO4SiK2RZDGAlLEcFDFeSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnknyb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:29:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b9ff555d2dso2163183085a.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768321748; x=1768926548;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cIn5H/EXHlleEAeuN1rT2GBXpPo6fP2DFr4Mp6yQNT0=;
 b=blJvBBkBVVATdmbm4apfwWIlG6uVK6xiN9JGz2F1yVbySN6BGDhzFplIjfzvYzcfcA
 XoIr2gFSbW3b5uNeRqlSILuXEcgNxcJiIt78y08j82QNJxAmCqKO2xedDdT24pNgjBwc
 yGBFr0fnIBRofB3gVuD64LL9vMyqwXvbOroHcDU/rexWwkbF5bVhPcEW5FMwWnkMuwMf
 eIbjintjr2gbxaCNR73AulephJolnJGPKXBF+/ijSUNJIKdWNPGbxsVCtT0xYP2WcHgk
 JJBjpZJy2TCxoJlNnPu78Le5qBgf7cbjxFFOJ/n7ZVGxHG0wCbTzp8i+Bsvo2ehB9Yda
 RGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768321748; x=1768926548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIn5H/EXHlleEAeuN1rT2GBXpPo6fP2DFr4Mp6yQNT0=;
 b=D5zGumaWFu3r32qMAO4uQWo8H/DbLkQL8rog0LNN4Pws13WcSuu0XGS3vPbTnHEpUK
 BtPeWJ6RKiNwbsUJk7V9Fb43BHEe3WnWZg0SOvli+2UOKTCEUlc1IcyrFijj/BCkDPJ6
 VvtZx+Ab2thsE2p1pG2wTvKQVTW46GLwMxEGWA2/olmzv4SLr9/4iFG+KbbrM4PRotYl
 fEKjJKXJfAYGTDHpqSHq+6wOd1Ggs/HjiCqlNXWqtFg3OKGTgYQvfWw+CoaJKN7UDLrR
 RSSsCjNjUCjBeajpWZolU0/lmuF1KdGaK25SHNcfMSpemPqy0MLEB6xlFacPS2tMJgFk
 FEXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi46GMvSvSxhlah3oGmSldbFp8JcqcKRIcWfX0aLauxGz9HBIrP2Xqo9TRluVVCsVS9oHtZ/DEKns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ4WxsGo0a/FAygUd0w3CqR/xUo9gaGRAxJuT9XABn60e03wJ2
 5etcXNa0XYBEt+fo9VDe5TSXkftRtjy9TzrdSbsxQMOSmnc3dvvD/OaGjcLkN86g4TGNX8Qq76Y
 7/XNjLHufB4e0K50VSvL8AtV4OQ5FHUPezBz/3slVkQ3Lgi3vCPaChvoMS11ghjGpbrg13GM=
X-Gm-Gg: AY/fxX6WICdKVNEXmMVz103EKcZ2L054FDNJod1PZ7rfJ8Ul1r7PgBPBOGqM71E6pDu
 YCywnQ4dvuTDLs/NRqwlEjombqzMrKk+utX8B99X2prn0UUFr6zGH6S0nrTJgN90SFiOGsp+yoq
 OceclSZJwwsyttlbook5zIof0iVOjZP1MRYJJ0a0sy6nDtDFJKzbhuNb+TPG6DuC3RYukZVQxpa
 EWymy5jI3Cbl0gS1n+Ilct327PsiUhxG7hRXeG8+TpSiJ3IUiNMLsuh5HOVBTcQIHfotMrML3m3
 B6422ne/Vxv1wKSysrFiHSAxi/0Fyv6BzcufeeupiAGqvRr21XRuWTs33Y3gZs0jisXVaZFhIO6
 JGkLbmUKiYanuuVlrWAbfBjwF83Bn3ckM8H01yAssfDfE+IjSy550NjzEEwNxur8oGluVPnlhie
 0AUAg6eIP9bU5nt8tOfWdu1jk=
X-Received: by 2002:a05:620a:1a97:b0:8a3:8a0:a4fe with SMTP id
 af79cd13be357-8c3893840f2mr2997451785a.32.1768321747697; 
 Tue, 13 Jan 2026 08:29:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVkPsQcxQkr+cU1eJ0h1aQeUhC2BF2dJvRQ4lN+2W+Xk0GRhFMTy0HCKzKnUPMS0T43c+GdQ==
X-Received: by 2002:a05:620a:1a97:b0:8a3:8a0:a4fe with SMTP id
 af79cd13be357-8c3893840f2mr2997446685a.32.1768321747192; 
 Tue, 13 Jan 2026 08:29:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b9fc41011sm71902e87.69.2026.01.13.08.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:29:06 -0800 (PST)
Date: Tue, 13 Jan 2026 18:29:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
X-Proofpoint-GUID: C_UDEx68UqRHSBa7YF3VElW0fZ6x6tjk
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=696672d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yH33JR1JA9jB6mUk05kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: C_UDEx68UqRHSBa7YF3VElW0fZ6x6tjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzNyBTYWx0ZWRfX0aj+VlWDhl+Q
 e5Dx1hzzBJXtOkzXrHVTdjHslnhZn7WEl0Xe5MzHNoHbplMxZWrfoAiH573lv5Lnp5Y3SnsaaN4
 PNHtEyeLkVhUvOqpUwC3HdKwOfsOv09aUm45n9nktiggUNhzXaVaPTNpfwjbWkivrOCFKgy7rIz
 vOvdZ8uAaEQoiR/17GlqIhY0+L7busFwtSy0pSj8aPVHcHmlNu9pJN3Qgko+QEgv5KwxJAOjdvd
 2eZuq0W8gDC703ePGE/1Bln/voT/TSIpKxZhwoBoUs4ozDFw77MlyUXHsxbPYWDA0i9vX5Dblrx
 fm05hWixsyf8dWNpVs+YXb+4vMcNPFZJRFntFyhWu6DKlxbSNwD+7eX/WqoHN+BU7fY4irf6V0J
 56gad5sLDjnbxXy37lHDKqofNVkqvEQpGwUMcVkW2EQItSa1zwrm7r2Z3xyfSYteHwZVAUImYLu
 FzIfzFgohAXh/SvcpFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130137
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

On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
> >> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
> >>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
> >>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> To make sure the correct settings for a given DRAM configuration get
> >>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
> >>>>>> what the BSP kernel does, albeit with through convoluted means of the
> >>>>>> bootloader altering the DT with this data).
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> ---
> >>>>>> I'm not sure about this approach - perhaps a global variable storing
> >>>>>> the selected config, which would then be non-const would be better?
> >>>>>
> >>>>> I'd prefer if const data was const, split HBB to a separate API.
> >>>>>
> >>>>
> >>>> I agree, but I'd prefer to avoid a separate API for it.
> >>>>
> >>>> Instead I'd like to either return the struct by value (after updating
> >>>> the hbb), but we then loose the ability to return errors, or by changing
> >>>> the signature to:
> >>>>
> >>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> >>>>
> >>>> This costs us an additional 16 bytes in each client (as the pointer is
> >>>> replaced with the data), but I think it's a cleaner API.
> >>>
> >>> What about:
> >>>
> >>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
> >>>
> >>> I really want to keep the data as const and, as important, use it as a
> >>> const pointer.
> >>>
> >>
> >> I guess the question is what are you actually trying to achive; my goal
> >> was to keep the base data constant, but I'm guessing that you also want
> >> to retain the "const" classifier in the client's context struct (e.g.
> >> the "mdss" member in struct dpu_kms)
> >>
> >> If we're returning the data by value, there's no way for you to mark
> >> it as "const" in the calling code's context object (as by definition you
> >> shouldn't be able to change the value after initializing the object).
> > 
> > And I, of course, misssed one star:
> > 
> > const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
> > 
> > This leaks the knowledge that HBB is slightly different kind of property
> > than the rest of UBWC data.
> > 
> >>
> >> You also can't return the data by value and then track it by reference -
> >> as that value lives on the stack. This has the benefit of making the
> >> lifecycle of that object clear (it lives in each client) - but perhaps
> >> not a goal of ours... 
> >>
> >> How come the ubwc config is const but the hbb isn't?
> >>
> >>
> >> If we want both the per-target data to remain const and data in the
> >> client's context to be carrying the const qualifier, the one solution I
> >> can see is:
> >>
> >> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> >> {
> >>         const struct qcom_ubwc_cfg_data *data;
> >>         static struct qcom_ubwc_cfg_data cfg;
> >>         int hbb;
> >>
> >>         ...
> >>
> >>         data = of_machine_get_match_data(qcom_ubwc_configs);
> >>         ...
> >>
> >>         hbb = qcom_smem_dram_get_hbb();
> >> 	...
> >>
> >>         cfg = *data;
> >>         cfg.highest_bank_bit = hbb;
> >>
> >>         return &cfg;
> >> }
> >>
> >> But we'd need to deal with the race in cfg assignment...
> > 
> > static struct qcom_ubwc_cfg_data *cfg;
> > static DEFINE_MUTEX(cfg_mutex);
> > const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> > {
> >         const struct qcom_ubwc_cfg_data *data;
> >         int hbb;
> > 
> > 	guard(mutex)(&cfg_mutex);
> > 
> > 	if (cfg)
> > 		return cfg;
> > 
> >         data = of_machine_get_match_data(qcom_ubwc_configs);
> > 	if (!data)
> > 		return ERR_PTR(-ENOMEM);
> > 
> >         hbb = qcom_smem_dram_get_hbb();
> > 	if (hbb = -ENODATA)
> > 		hbb = 15; /* I think it was default */
> > 	else if (hbb < 0)
> > 		return ERR_PTR(hbb);
> > 
> >         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
> > 	if (!cfg)
> > 		return ERR_PTR(-ENOMEM);
> > 
> >         cfg->highest_bank_bit = hbb;
> > 
> > 	return cfg;
> > }
> > 
> > This potentially leaks sizeof(*data) memory if the module gets removed.
> > Granted that all users also use qcom_ubwc_config_get_data() symbol, it
> > should be safe to kfree(cfg) on module removal.
> 
> I really don't understand why you'd want a separate API for hbb, if
> hbb is already available from the larger struct *and* if a driver needs
> to know about the value of hbb, it really needs to know about all the
> other values as well

Please take another look, qcom_ubwc_config_get_data() is the only public
API, qcom_smem_dram_get_hbb() is an internal API.

My goal is to keep having UBWC db which keeps const data and which which
also returns a const pointer.

-- 
With best wishes
Dmitry
