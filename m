Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF26D19F21
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 16:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F1710E502;
	Tue, 13 Jan 2026 15:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVAg5nl8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNMC8kr+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD89F10E502
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:36:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DCZUkW3810613
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=; b=HVAg5nl8cM8zVS55
 yzTwaJZofsza0OYMHTHTAKvCUU8PwAc/De1TvXO1ZmV9nkOPOSeTH6bMSxP7H2WJ
 o7D1DcsNroLmWfv7RdYZPOHZCynwKsBEpO+Gs8u1DnP9h093OA4GGM4I2gWtjt0p
 sUvkKsgalPsVQG1miyVlGLl25lFud7Ow2y+TJxrg67b5CrMM56JF+6gTMtUxCoJu
 rqypROXHFElreUUe1o7jip78/+JEhWI8Wi60Zii/nXcHaSW+iZaTaQfi/XcrVrCC
 BLTd926XILVDqK75JciZnD+k5DReXMxXhj51ndYCIQgqCCbaLsjS3EeqK8YruFz4
 lJ4vCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55svvk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:36:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c523d611ffso11950885a.2
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 07:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768318586; x=1768923386;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=;
 b=VNMC8kr+GjS72JC1OVwOCjFTqI+adrw0fzfBH1f8qzmXg1IbMGCLSqI2JIA9/nc8l5
 b5jAq/Y+tgT4+qzAUfjELk6N56QHv/sNheaa13Db3ISr3RiXGBgNB3OHvg+z12OUvyvi
 fJkewlBew2HRZJRg8DthEqkr7H9uE5+n/3JyyOZ5bFbV94TNUGlIWaq8Vevf7FFPoXgq
 cETcaBYJr/n2tuF3evy/S7AxzPZX4u5WChPRimtNoqIrK+HarTsxshTtOu7KsXqa8kMp
 CL9q7cxsc9fjh3FFgAhzKEt+L47xbpH2PN/ETBX/8KITYwIuy4QisZ5f8DbX1bdXV2EU
 CkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318586; x=1768923386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=;
 b=VpKeqomWH6xslwiCJI3d5PDASfFJX8ZAVoosCzrOYAYF29RykDHHPFD1/Dgayyu5rF
 D4+M70gTO46/w+/Fg8XL6GgDR4DxSQa5wbF4OmvQrgA9THyKZjnnxxYB57JhgAVSNd3p
 sZn0p9ZblJrdlqbuP3yA+ia19QQqADuOh2PAhCh+SXxIOHAabgO1RFVC/w6nhIJe7atM
 Zp7STO942icX7GlBuGxr4PGvwV2tf9lLlrzwG4nH9JSNqhIeIHuBpX9SojinZ1GR83YB
 w9YlbsKIg7sVWazleMM+bVLxDdXQcBiBWo8EGv8L7WxQV5sOe7E8Yv5OtRZYIVPaa3co
 zYgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnlaSx7mbG03BVlwvWhRPlHCrQ18P1j5+w5uZicn7OET4HqmLz0wqgxgO5A3DyBUEZob9tqDdtuSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0FJuumbc/Odo1DQF1qlsRm9I9g9jQ+BHBXMWuWDwuiGaCL60k
 VRplw4fUMcW10X1m3VvGR5FV97WhFbDn65IWULOv+kwWZXus+rfoOhjEfuyaLXepSV3ICnZPfL0
 OwEfkHMWGLVWF3sDJohDs2mY5ikF8sMrHobMklkLd9S0fCqAqXek9nvU+sl++587p4KuytU0=
X-Gm-Gg: AY/fxX6NwsnAn9/NTH3JDU3JZ0EVOkiyKODF+0TV9TlZrwfAZFubZ7HvbqRbB5W9OrK
 HpindFKN8n0MSbQf8OWZOCMRbdRI9/WekhOc2QMu6kmuGTh4SDjsWLxCAQ4ezUMSUZbjvtWC6tC
 yRfn5IMZqpFfJJH12Zr9YrSzrBmsjOCKH1OsOfVIEbhJ9YNEgHJ95BMtySSWlFePy+heX8kAd5I
 lukEwejRijH63ZtNWfKbe+TMZqRqtHRSe7f+Q7LVg26pA+WANMXbo/ySpUTVCcwJMkCwLQA2zTA
 1QbBNwr+/PmYJZ4nsXA7Erpe60zhor94VOEHQVpDlrO863LyU4cByVsMvYVhl38GkwKbpoeiJOJ
 OhdWzuHQUZQxxgiBUt6g6KaPznBsSRvMnK2Kh3luCYuR46hxMtv0GMJnn9OnTGaCO9pM=
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id
 af79cd13be357-8c389410364mr2118449785a.10.1768318584803; 
 Tue, 13 Jan 2026 07:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMLwqRlVP/7fKfi+RZDpnX5OZ7Qgk9Q1gQb/STq85+GeJMS+CL71WIBqS8kpTydKMXpn6Oqw==
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id
 af79cd13be357-8c389410364mr2118445685a.10.1768318584257; 
 Tue, 13 Jan 2026 07:36:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b870889ac26sm819561366b.28.2026.01.13.07.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:36:23 -0800 (PST)
Message-ID: <40193ace-36b9-4e05-83b3-9539534bb1ac@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cwVK7FczyiNvexXW36IzxQzwxOtZ-J1q
X-Proofpoint-ORIG-GUID: cwVK7FczyiNvexXW36IzxQzwxOtZ-J1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzMCBTYWx0ZWRfX6cESHzPQ8RZ1
 pqB3gbPALYgFm5ln18fP8PwEcNetq/J2lHlWRE7k5H2T3bQYZG10ypmZN16zBGYhQjD3XE9b345
 zZV3J+3UQVrCCRXdJDYc2SVvio33mgJRzlJYi71Fy6k93l6fjuEVWHLaCHv0fzZ0B74Dxi7iJfO
 iJzcp2S4Z7gpHc88aPAOqn7+h5w8oL1J/4mHSvMX4AT/YjY5Cx5VKTukzX3bLroM3VC+EB9BQpn
 lCzIGDCyl9BHqK/D5wrNnl316o3ONdwWMAKiQAS/jPUmytl/xbIGnO15kKs7xOi9I24Rb19JOui
 yyLe9Vj3nIpYry3+aKxXfgmnT6x5EjHOQZFzik+83hOA0oJkJqddkktrFoC7wV7d5oloBm3Z4Lg
 N8O1RYB58Z0wdyMNrPKcAknhDy2rvJCjg0PqZC4pJ8WpPzED4ZOdr5PR8/uNf0VGDnJx+xdU4uP
 lTfpjd3b3ZtLlHvqMmw==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=6966667b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=egEcnhzrLz9U2KnhiLcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130130
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

On 1/8/26 6:49 PM, Bjorn Andersson wrote:
> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> To make sure the correct settings for a given DRAM configuration get
>>> applied, attempt to retrieve that data from SMEM (which happens to be
>>> what the BSP kernel does, albeit with through convoluted means of the
>>> bootloader altering the DT with this data).
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> ---
>>> I'm not sure about this approach - perhaps a global variable storing
>>> the selected config, which would then be non-const would be better?
>>
>> I'd prefer if const data was const, split HBB to a separate API.
>>
> 
> I agree, but I'd prefer to avoid a separate API for it.
> 
> Instead I'd like to either return the struct by value (after updating
> the hbb), but we then loose the ability to return errors, or by changing
> the signature to:
> 
> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> This costs us an additional 16 bytes in each client (as the pointer is
> replaced with the data), but I think it's a cleaner API.

I don't see how that's much better than

static const qcom_ubwc_cfg_data foobar_ubwc_data = {
	...
};

static qcom_ubwc_cfg __data;
const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
{
	...

	if (__data)
		return data;

	__data = of_machine_get_match_data()
	...

	hbb = ...;

	__data->hbb = hbb;

	return data; //still returns a constptr
}

Since we essentially do the same thing, except we save space and rest
assured the various client drivers don't mess with the data they receive

Konrad
