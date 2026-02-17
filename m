Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EILaKU5mlGkFDgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 17 Feb 2026 13:59:58 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619614C3A5
	for <lists+freedreno@lfdr.de>; Tue, 17 Feb 2026 13:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3568F10E23B;
	Tue, 17 Feb 2026 12:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrzkrI4q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSis+YjL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B4610E4D1
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 12:59:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HAcieP2803225
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 12:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s0wA2FAQrRIGzPhPiBC+jIJgFGTOYwSshXjcsEayItQ=; b=LrzkrI4qeTtEcSHQ
 xzsFERCf21mSUWkLSZdYkdcP5UMuBa314R5LBNEBiKGVayLnNOvhn/BJsqpsfD3n
 bmSpOOx/C7ZH58ZRKtA/BdAnLPbOxw3UHPztCW/GCfSGmAVkVq7w2Q4jMlj3y27l
 wKSr81teZ6Tn7T/xtJb13uKmv0d5ipWkKBEUoqJe7WwEHr0EWH4a9BjGwG4c0AE2
 kE/isX9H3Pge0CMe7C3321zr4v7ceOPZ5Wj1cqpzH95yU4/O6FrnNKGaBo8AajHs
 PelJLnDrTqx1Yt1BDmLHqD5YzunFill2Ra6nvdrjqr2gr8FvLiYnEofGVwi1BifZ
 2sOECA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxukh23-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 12:59:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c7177d4ab4so303390285a.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 04:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771333192; x=1771937992;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s0wA2FAQrRIGzPhPiBC+jIJgFGTOYwSshXjcsEayItQ=;
 b=XSis+YjLa8m2JZ3msu7dXcjUlI/U2fupkYoZBl2B4kt5XYu4kbsJrhMHGbQAMNOOnW
 TbG3EwL3CXlqUl3uqdQ6NBAgTJrTPuBQYQ9kFjbmUrPX1ev/EN7OIoGBpw7W6utxGEv5
 My4rhIwXUv1F446XF/SH36U0d7mHg5WPbrXnTr8V/GBG9hJusuvAbZEvIiH8HMYj95PC
 uGbwXNtrOsKUQyD4Sxrda9l/CALkKsd2O51QLEJmOyds/lJMIgoR3dU47bobwfDO/EjE
 7819d/KBGeMsQfkKa2Ne5Q0FwZ+7amoPjCYYQlqSzWU5CDwCwBhzmBrQkb6plHBoRdN4
 DgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771333192; x=1771937992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s0wA2FAQrRIGzPhPiBC+jIJgFGTOYwSshXjcsEayItQ=;
 b=ihTCFFWoTCN3leJF+yrN+7dO4eKSjizrkEc8OD0iLvpd3hfeyIqkY5UOo0WATsrLhr
 sYwyjhXmVN1NhzUZEI2gqonEmgOU6XVDUvH6jUffHYxcW/4rDeV+CU9IRMZqguiIaHnl
 Cv40wl8O0y+MggWu72cmNfdcBtRcTKACj5nPEiK8DTVrygN4zbm1w5wM6X2hzkVQA4Hw
 3kh5wx0I/8MeSSVXlgug7j2rDCCpBjNBaHzNcOHchC3pEhheOojMHgKlB3gSfMk4qso4
 AhRg72Ss4mTkWPB1Ny7PYcd8Gw0fn4byLjzKV+dF0areOYf4HgVpVVsefPyPrBQTYmSF
 WUGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOTgrvaLt1JZ77aGK/18TlNYo2iSPnDkjXgzz+MYeNYhnxDe/v1K7zEAqXNI2j51Fr6nznjYMKEUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws1Zo1POw9uLfvDGa97kDeG/QWniDiBAwOk+mfl9z2q/oFDPmc
 sB6TX/nCXEmL2UX8mHuPdB25BMokTTeR1/Gd5Md/Zt1UScbx/X2fJMx1dWRDXBkqmw5lLt/oENT
 Z5gQ454gIXaOeeZ4THxYiVXmOixkog6OEI5fyObdZmuPyn60gSU3mGDwbaDi9c41/W1zjc3s=
X-Gm-Gg: AZuq6aIhrwCRblhFCtE7bvEgNAyt7eZjMFQjN8FuMS60vGSreJHf8Un/xsTYL0pRFMX
 8wiXmPP2N+Hwn/YsJ7dMjaddbzf2D7xOYadHFwbhT4UnRnsbHRdA+u8rcDS18Cz8qh+l9IjHTfJ
 xF7XPCU+pWHwlhu77ZPp3Oo6f5LU3eM0DJirh9HHK1ei5wgbH9wyS708cOuoE69PIEBquME6AN/
 j3TsucKT1xygPIotX0dMvsIpVnLWOO8EnToUeeMsBfo7jDUUxnkmwoUoPlYlqsqvzOskUgYWxSB
 jAuMGhseDaVHrFboYpZ7ER0EhFkRiA4TuOUq8wKCqPFvlVvLGKkanNX1h5cuJT+3hxMschCpNJd
 K96FL8RhCCc6knkObIYr9N9QtCoCA4NbZSkYUGXaMJx+wWAat0dJLrtOwEwQMUH/Wc270Xerk/l
 y8HBc=
X-Received: by 2002:a05:620a:1714:b0:8c7:110c:762f with SMTP id
 af79cd13be357-8cb40850a6cmr1368757885a.4.1771333192544; 
 Tue, 17 Feb 2026 04:59:52 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8c7:110c:762f with SMTP id
 af79cd13be357-8cb40850a6cmr1368753885a.4.1771333192029; 
 Tue, 17 Feb 2026 04:59:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7385e60sm346966866b.19.2026.02.17.04.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 04:59:51 -0800 (PST)
Message-ID: <203f6f63-e81d-4db5-8ede-ff6695a847ed@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
 <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
 <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iqg6jpq4i3olwugnlnsczisbrbysxzik6otby3pgkv5uqsez3f@diwpjgf26mk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hrENrzNwT17VoA-eurf9wq6cw2_WQgOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX/caSmlFmBnfr
 jPBtx5vj/NGTVOda5auDbuB2C3gDCgiO7j1MTVy+r4y5fp3j6tQZSrSoDlNsYvgHoHQMNL433s2
 +WlxUkd4OpPq/jswPiuzRq1/yC++5f/UoO9pjXHDpXU50La/JsLYiQmSH7vQmR8adGQuaFQv07h
 s1f9zYWSM1y/m9htOuU/p2KcN1iadLVb8dKY5BmdzXcSi5F6bG/ZaHARXhDcqsNESskk66pLGq+
 XQLzx0MV7YUahDfc2dYh4Mhg0v1qLftgWgwIcwup8iewTm3+blT8XfDFCGo8ugiOsTbnvQLgl7J
 6h+BaGUoNQa/6b2FsU72yN4vNbZTWf1XdyfIzXbVnpVJoJmCQmV8qRhI+gIpObPt4QtzJuqO687
 MF16NY6Gn8xvzJFBIpQTRw+dg409jXcNoz6tfTKt2NLKASgK+UaiIndLap2Xr6Nc//MJXV20KFB
 BDFhEqyJzOG4DBsbt0A==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69946649 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=R9SVTSvzoFrXFbf9F0wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hrENrzNwT17VoA-eurf9wq6cw2_WQgOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 0619614C3A5
X-Rspamd-Action: no action

On 1/13/26 5:29 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 13, 2026 at 04:31:15PM +0100, Konrad Dybcio wrote:
>> On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
>>>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
>>>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> To make sure the correct settings for a given DRAM configuration get
>>>>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
>>>>>>>> what the BSP kernel does, albeit with through convoluted means of the
>>>>>>>> bootloader altering the DT with this data).
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>> I'm not sure about this approach - perhaps a global variable storing
>>>>>>>> the selected config, which would then be non-const would be better?
>>>>>>>
>>>>>>> I'd prefer if const data was const, split HBB to a separate API.
>>>>>>>
>>>>>>
>>>>>> I agree, but I'd prefer to avoid a separate API for it.
>>>>>>
>>>>>> Instead I'd like to either return the struct by value (after updating
>>>>>> the hbb), but we then loose the ability to return errors, or by changing
>>>>>> the signature to:
>>>>>>
>>>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
>>>>>>
>>>>>> This costs us an additional 16 bytes in each client (as the pointer is
>>>>>> replaced with the data), but I think it's a cleaner API.
>>>>>
>>>>> What about:
>>>>>
>>>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
>>>>>
>>>>> I really want to keep the data as const and, as important, use it as a
>>>>> const pointer.
>>>>>
>>>>
>>>> I guess the question is what are you actually trying to achive; my goal
>>>> was to keep the base data constant, but I'm guessing that you also want
>>>> to retain the "const" classifier in the client's context struct (e.g.
>>>> the "mdss" member in struct dpu_kms)
>>>>
>>>> If we're returning the data by value, there's no way for you to mark
>>>> it as "const" in the calling code's context object (as by definition you
>>>> shouldn't be able to change the value after initializing the object).
>>>
>>> And I, of course, misssed one star:
>>>
>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
>>>
>>> This leaks the knowledge that HBB is slightly different kind of property
>>> than the rest of UBWC data.
>>>
>>>>
>>>> You also can't return the data by value and then track it by reference -
>>>> as that value lives on the stack. This has the benefit of making the
>>>> lifecycle of that object clear (it lives in each client) - but perhaps
>>>> not a goal of ours... 
>>>>
>>>> How come the ubwc config is const but the hbb isn't?
>>>>
>>>>
>>>> If we want both the per-target data to remain const and data in the
>>>> client's context to be carrying the const qualifier, the one solution I
>>>> can see is:
>>>>
>>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>>>> {
>>>>         const struct qcom_ubwc_cfg_data *data;
>>>>         static struct qcom_ubwc_cfg_data cfg;
>>>>         int hbb;
>>>>
>>>>         ...
>>>>
>>>>         data = of_machine_get_match_data(qcom_ubwc_configs);
>>>>         ...
>>>>
>>>>         hbb = qcom_smem_dram_get_hbb();
>>>> 	...
>>>>
>>>>         cfg = *data;
>>>>         cfg.highest_bank_bit = hbb;
>>>>
>>>>         return &cfg;
>>>> }
>>>>
>>>> But we'd need to deal with the race in cfg assignment...
>>>
>>> static struct qcom_ubwc_cfg_data *cfg;
>>> static DEFINE_MUTEX(cfg_mutex);
>>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>>> {
>>>         const struct qcom_ubwc_cfg_data *data;
>>>         int hbb;
>>>
>>> 	guard(mutex)(&cfg_mutex);
>>>
>>> 	if (cfg)
>>> 		return cfg;
>>>
>>>         data = of_machine_get_match_data(qcom_ubwc_configs);
>>> 	if (!data)
>>> 		return ERR_PTR(-ENOMEM);
>>>
>>>         hbb = qcom_smem_dram_get_hbb();
>>> 	if (hbb = -ENODATA)
>>> 		hbb = 15; /* I think it was default */
>>> 	else if (hbb < 0)
>>> 		return ERR_PTR(hbb);
>>>
>>>         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
>>> 	if (!cfg)
>>> 		return ERR_PTR(-ENOMEM);
>>>
>>>         cfg->highest_bank_bit = hbb;
>>>
>>> 	return cfg;
>>> }
>>>
>>> This potentially leaks sizeof(*data) memory if the module gets removed.
>>> Granted that all users also use qcom_ubwc_config_get_data() symbol, it
>>> should be safe to kfree(cfg) on module removal.
>>
>> I really don't understand why you'd want a separate API for hbb, if
>> hbb is already available from the larger struct *and* if a driver needs
>> to know about the value of hbb, it really needs to know about all the
>> other values as well
> 
> Please take another look, qcom_ubwc_config_get_data() is the only public
> API, qcom_smem_dram_get_hbb() is an internal API.
> 
> My goal is to keep having UBWC db which keeps const data and which which
> also returns a const pointer.

Right

So if I understand correctly, this is almost exactly what I originally had
in mind in the under-"---" message (modulo having a static global ptr vs full
struct instance) but I failed to express that I wanted to keep returning a
const pointer to the consumers

So in the end it's

A) int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)

vs 

B) const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)

I think the latter is better since we won't have to store a separate copy
of the config in each consumer driver (which the SSOT rework was largely
sparked by), essentially removing the ability for any of these drivers to
mess with the config internally and make it out-of-sync with others again

Konrad

